sechzig.blocking =
  initialize: ->
    @movements = [
      movement =
        'section' : 'scene-one',
        'character' : ".character",
        'startTime' : 0.5,
        'finishTime' : 1,
        'startValues' : {
          'translateY' : 0,
          'opacity': 1
        }
        'finishValues' : {
          'translateY' : -100,
          'opacity' : -1
        }
      movement =
        'section' : 'scene-two',
        'character' : ".character",
        'startTime' : 0,
        'finishTime' : 1,
        'startValues' : {
          'rotate' : 0
        }
        'finishValues' : {
          'rotate' : 360
        }
      movement =
        'section' : 'scene-four',
        'character' : ".character",
        'startTime' : 0,
        'finishTime' : 0.5,
        'startValues' : {
          'scale' : 4
        }
        'finishValues' : {
          'scale': 1
        }
    ]

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
