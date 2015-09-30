sechzig.scene =
  initialize: ->
    sechzig.raf.register(sechzig.scene.monitorScenes)

  monitorScenes: ->
    for scene in sechzig.stage.scenes
      sechzig.backing.setStickyScene(scene) unless scene.sticky == false
      if sechzig.scene.status(scene)
        sechzig.scene.setActive(scene)
        sechzig.scene.directActiveScenes(scene)
      else
        sechzig.scene.setInactive(scene)

  status: (scene) ->
    (sechzig.scroll.scrollTop >= scene.top and sechzig.scroll.scrollTop <= scene.bottom) or
    (sechzig.scroll.scrollBottom >= scene.top and sechzig.scroll.scrollBottom <= scene.bottom)

  directActiveScenes: (scene) ->
    sechzig.scene.getSceneProgress(scene)
    sechzig.blocking.getBlockingProgress(scene)

  getSceneProgress: (scene) ->
    scene.progress = (sechzig.scroll.scrollBottom - scene.top)/scene.duration

  setActive: (scene) ->
    scene.object.trigger('active') unless scene.sceneIsActive
    scene.sceneIsActive = true

  setInactive: (scene) ->
    scene.object.trigger('inactive') if scene.sceneIsActive
    scene.sceneIsActive = false

$ ->
  sechzig.scene.initialize()
