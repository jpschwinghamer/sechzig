sechzig.blocking =
  initialize: ->
    @movements = sechzig.keyframes

  assignMovements: (scene) ->
    sceneMovements = []
    for movement in sechzig.blocking.movements
      if movement.scene == scene
        sechzig.movement.setDefaultMovements(movement)
        sechzig.blocking.setMovementObject(movement)
        sceneMovements.push(movement)
    sceneMovements

  getBlockingProgress: (scene) ->
    for movement in scene.blocking
      movement.startPixel = (movement.startTime * scene.duration) + scene.top
      movement.finishPixel = (movement.finishTime * scene.duration) + scene.top
      movement.pixelDistance = movement.finishPixel - movement.startPixel
      movement.pixelProgress = sechzig.scroll.scrollBottom - movement.startPixel
      if sechzig.blocking.status(movement)
        sechzig.movement.animateMovement(scene, movement)
        sechzig.blocking.setActive(movement)
      else
        sechzig.blocking.setInactive(movement)

  setMovementObject: (movement) ->
    movement.object = $("##{movement.scene + " " + movement.character}")

  status: (movement) ->
    (sechzig.scroll.scrollBottom >= movement.startPixel) and (sechzig.scroll.scrollBottom <= movement.finishPixel)

  setActive: (movement) ->
    movement.object.trigger('active') unless movement.movementIsActive
    movement.movementIsActive = true

  setInactive: (movement) ->
    movement.object.trigger('inactive') if movement.movementIsActive
    movement.movementIsActive = false

$ ->
  sechzig.blocking.initialize()
