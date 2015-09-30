sechzig.scene =
  initialize: ->
    sechzig.raf.register(sechzig.scene.monitorScenes)

  monitorScenes: ->
    for scene in sechzig.stage.scenes
      sechzig.backing.setStickyScene(scene) unless scene.sticky == false
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

  getSceneProgress: (scene) ->
    scene.progress = (sechzig.scroll.scrollBottom - scene.top)/scene.duration

$ ->
  sechzig.scene.initialize()
