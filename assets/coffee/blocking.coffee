sechzig.blocking =
  initialize: ->
    @movements = [
      movement =
        'section' : 'scene-three',
        'character' : ".character",
        'startTime' : 0,
        'finishTime' : 0.5,
        'startValues' : {
          'rotate' : 0
        }
        'finishValues' : {
          'rotate' : 180
        }
      movement =
        'section' : 'scene-two',
        'character' : ".theng",
        'startTime' : 0,
        'finishTime' : 0.5,
        'startValues' : {
          'scale' : 4
        }
        'finishValues' : {
          'scale': 1
        }
      movement =
        'section' : 'scene-two',
        'character' : ".thing",
        'startTime' : 0.25,
        'finishTime' : 0.5,
        'startValues' : {
          'opacity' : 0,
          'scale' : 0.8
        }
        'finishValues' : {
          'opacity': 1,
          'scale' : 1
        }
      movement =
        'section' : 'scene-four',
        'character' : ".character",
        'startTime' : 0.25,
        'finishTime' : 0.5,
        'startValues' : {
          'translateX' : 0
        }
        'finishValues' : {
          'translateX': -25
        }
      movement =
        'section' : 'scene-four',
        'character' : ".character",
        'startTime' : 0.5,
        'finishTime' : 0.75,
        'startValues' : {
          'translateX' : -25,
          'translateY' : 0
        }
        'finishValues' : {
          'translateX' : -25,
          'translateY' : -25,
          'opacity' : 0
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
