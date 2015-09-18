sechzig.scene =
  initialize: ->
    sechzig.raf.onScroll(sechzig.scene.monitorScenes)

  monitorScenes: ->
    for scene in sechzig.stage.scenes
      if sechzig.scene.sceneIsActive(scene)
        scene.sceneIsActive = true
        sechzig.scene.directActiveScenes(scene)
      else
        scene.sceneIsActive = false

  sceneIsActive: (scene) ->
    (sechzig.scroll.scrollTop >= scene.top and sechzig.scroll.scrollTop <= scene.bottom) or
    (sechzig.scroll.scrollBottom >= scene.top and sechzig.scroll.scrollBottom <= scene.bottom)

  directActiveScenes: (scene) ->
    sechzig.scene.getSceneProgress(scene)
    sechzig.blocking.getBlockingProgress(scene)
    sechzig.backing.setStickyScene(scene) unless scene.sticky == false

  getSceneProgress: (scene) ->
    scene.progress = Math.max(Math.min((sechzig.scroll.scrollBottom - scene.top)/scene.duration, 1), 0)

$ ->
  sechzig.scene.initialize()
