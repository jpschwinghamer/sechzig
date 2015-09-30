sechzig.blocking =
  initialize: ->
    @movements = sechzig.keyframes

  assignMovements: (section) ->
    sectionMovements = []
    for movement in sechzig.blocking.movements
      if movement.section == section
        sechzig.movement.setDefaultMovements(movement)
        sectionMovements.push(movement)
    sectionMovements

   getBlockingProgress: (scene) ->
    for movement in scene.blocking
      movement.startPixel = (movement.startTime * scene.duration) + scene.top
      movement.finishPixel = (movement.finishTime * scene.duration) + scene.top
      movement.pixelDistance = movement.finishPixel - movement.startPixel
      movement.pixelProgress = sechzig.scroll.scrollBottom - movement.startPixel
      if (sechzig.scroll.scrollBottom >= movement.startPixel) and (sechzig.scroll.scrollBottom <= movement.finishPixel)
        sechzig.movement.animateMovement(scene, movement)

$ ->
  sechzig.blocking.initialize()
