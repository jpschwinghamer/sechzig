sechzig.blocking =
  initialize: ->
    @movements = [

      movement =
        'section' : 'scene-one',
        'character' : ".thang",
        'startTime' : 0.5,
        'finishTime' : 0.9,
        'startValues' : {
          'opacity': 1,
          'translateY' : 0
        }
        'finishValues' : {
          'opacity': -1.75,
          'translateY': -50
        }
      movement =
        'section' : 'scene-one',
        'character' : ".theng",
        'startTime' : 0.5,
        'finishTime' : 0.9,
        'startValues' : {
          'opacity': 1,
          'translateY' : 0,
          'scale' : 1
        }
        'finishValues' : {
          'opacity': -1.75,
          'translateY': -100,
          'scale': 2
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
      if (sechzig.scroll.scrollBottom >= movement.startPixel) and (sechzig.scroll.scrollBottom <= movement.finishPixel)
        movement.totalPixels = movement.finishPixel - movement.startPixel
        movement.progress = (sechzig.scroll.scrollBottom - movement.startPixel)/movement.totalPixels
        sechzig.movement.animateMovement(scene, movement)

$ ->
  sechzig.blocking.initialize()
