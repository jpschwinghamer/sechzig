sechzig.stage =
  initialize: ->
    @arrangeScenes()
    @monitorScenes()
    sechzig.raf.onScroll(sechzig.stage.monitorScenes)

  arrangeScenes: ->
    @scenes = []
    $('.scene').each ->
      $this = $(this)
      scenesHash =
        id: $this.attr('id')
        top: $this.offset().top
        bottom: $this.offset().top + $this.height()
        height: $this.height()
        object: $this
        duration: $this.height() + sechzig.scroll.scrollHeight
        sceneIsActive: false
        progress: 0
        blocking: sechzig.blocking.assignMovements(@id)
        sticky: $this.data('sticky') || false
      sechzig.stage.scenes.push(scenesHash)

  monitorScenes: ->
    for scene in sechzig.stage.scenes
      if sechzig.stage.sceneIsActive(scene)
        scene.sceneIsActive = true
        sechzig.stage.directActiveScenes(scene)
      else
        scene.sceneIsActive = false

  sceneIsActive: (scene) ->
    (sechzig.scroll.scrollTop >= scene.top and sechzig.scroll.scrollTop <= scene.bottom) or
    (sechzig.scroll.scrollBottom >= scene.top and sechzig.scroll.scrollBottom <= scene.bottom)

  directActiveScenes: (scene) ->
    sechzig.stage.getSceneProgress(scene)
    sechzig.stage.getBlockingProgress(scene)
    sechzig.stage.setStickyScene(scene) unless scene.sticky == false

  getSceneProgress: (scene) ->
    scene.progress = Math.max(Math.min((sechzig.scroll.scrollBottom - scene.top)/scene.duration, 1), 0)

  getBlockingProgress: (scene) ->
    for movement in scene.blocking
      movement.startPixel = (movement.startTime * scene.duration) + scene.top
      movement.finishPixel = (movement.finishTime * scene.duration) + scene.top
      movement.totalPixels = movement.finishPixel - movement.startPixel
      movement.progress = (sechzig.scroll.scrollBottom - movement.startPixel)/movement.totalPixels

      if movement.progress >= 0 and movement.progress <= 1
        sechzig.stage.animateMovement(scene, movement)

  animateMovement: (scene, movement) ->
    $("##{scene.id} #{movement.character}").css({
      'opacity':      movement.finishValues.opacity * movement.progress + movement.startValues.opacity,
      'transform' :   "translate3d(
                        #{movement.finishValues.translateX * movement.progress + movement.startValues.translateX}vw,
                        #{movement.finishValues.translateY * movement.progress + movement.startValues.translateY}vh,
                        0)
                      rotate(
                        #{movement.finishValues.rotate * movement.progress + movement.startValues.rotate}deg)"
    })

  setStickyScene: (scene) ->
    @blocking = scene.object.find('.blocking')
    switch scene.sticky
      when "top"
        if scene.top <= sechzig.scroll.scrollTop and scene.bottom >= sechzig.scroll.scrollBottom
          @blocking.css({
            'position': 'fixed',
            'top' : 0,
            'bottom': 'auto',
          })
        if scene.top >= sechzig.scroll.scrollTop
          @blocking.css({
            'position': 'static'
          })
        if scene.bottom <= sechzig.scroll.scrollBottom
          @blocking.css({
          'position': 'absolute',
          'bottom': 0,
          'top': 'auto'
          })

      when "bottom"
        if scene.top <= sechzig.scroll.scrollBottom
          scene.object.find('.blocking').css({
            'position' : 'fixed',
            'bottom' : 0
          })
        else
          scene.object.find('.blocking').css({'position' : 'static'})

$ ->
  sechzig.stage.initialize()
