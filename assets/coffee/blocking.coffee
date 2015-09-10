sechzig.blocking =
  initialize: ->
    @movements = [

      movement =
        'section' : 'scene-one',
        'character' : ".thing",
        'startTime' : 0.5,
        'finishTime' : 1,
        'startValues' : {
          'translateX' : 0,
          'translateY' : 0,
          'rotate' : 0,
          'scale' : 1,
          'opacity': 1
        }
        'finishValues' : {
          'translateX' : 0,
          'translateY' : 250,
          'rotate' : 0,
          'opacity' : -1
        }
      movement =
        'section' : 'scene-one',
        'character' : ".thang",
        'startTime' : 0.5,
        'finishTime' : 1,
        'startValues' : {
          'translateX' : 0,
          'translateY' : 0,
          'rotate' : 0,
          'scale' : 1,
          'opacity': 1
        }
        'finishValues' : {
          'translateX' : 0,
          'translateY' : 150,
          'rotate' : 0,
          'opacity' : -1
        }
      movement =
        'section' : 'scene-one',
        'character' : ".theng",
        'startTime' : 0.5,
        'finishTime' : 1,
        'startValues' : {
          'translateX' : 0,
          'translateY' : 0,
          'rotate' : 0,
          'scale' : 1,
          'opacity': 1
        }
        'finishValues' : {
          'translateX' : 0,
          'translateY' : 50,
          'rotate' : 0,
          'opacity' : -1
        }
      movement =
        'section' : 'scene-two',
        'character' : ".thong",
        'startTime' : 0.5,
        'finishTime' : 0.75,
        'startValues' : {
          'translateX' : 0,
          'translateY' : 0,
          'rotate' : 0,
          'scale' : 1,
          'opacity': 1
        }
        'finishValues' : {
          'translateX' : -50,
          'translateY' : 0,
          'rotate' : 0,
          'opacity' : -1
        }
      movement =
        'section' : 'scene-two',
        'character' : ".theng",
        'startTime' : 0.5,
        'finishTime' : 0.75,
        'startValues' : {
          'translateX' : 0,
          'translateY' : 0,
          'rotate' : 0,
          'scale' : 1,
          'opacity': 1
        }
        'finishValues' : {
          'translateX' : 0,
          'translateY' : -50,
          'rotate' : 0,
          'opacity' : -1
        }
      movement =
        'section' : 'scene-three',
        'character' : ".thing",
        'startTime' : 0,
        'finishTime' : 0.333333,
        'startValues' : {
          'translateX' : 0,
          'translateY' : -50,
          'rotate' : 0,
          'scale' : 0,
          'opacity': 0
        }
        'finishValues' : {
          'translateX' : 0,
          'translateY' : 50,
          'rotate' : 0,
          'opacity' : 1
        }
      movement =
        'section' : 'scene-six',
        'character' : ".thing",
        'startTime' : 0,
        'finishTime' : 0.25,
        'startValues' : {
          'translateX' : 0,
          'translateY' : -50,
          'rotate' : 0,
          'scale' : 0,
          'opacity': 0
        }
        'finishValues' : {
          'translateX' : 0,
          'translateY' : 50,
          'rotate' : 0,
          'opacity' : 1
        }
      movement =
        'section' : 'scene-six',
        'character' : ".thang",
        'startTime' : 0,
        'finishTime' : 0.25,
        'startValues' : {
          'translateX' : 0,
          'translateY' : -150,
          'rotate' : 0,
          'scale' : 0,
          'opacity': 0
        }
        'finishValues' : {
          'translateX' : 0,
          'translateY' : 150,
          'rotate' : 0,
          'opacity' : 1
        }
      movement =
        'section' : 'scene-six',
        'character' : ".theng",
        'startTime' : 0,
        'finishTime' : 0.25,
        'startValues' : {
          'translateX' : 0,
          'translateY' : 0,
          'rotate' : 0,
          'scale' : 0,
          'opacity': 0
        }
        'finishValues' : {
          'translateX' : 0,
          'translateY' : 0,
          'rotate' : 0,
          'opacity' : 1
        }
    ]

  assignMovements: (section) ->
    sectionMovements = []
    for movement in sechzig.blocking.movements
      if movement.section == section
        sectionMovements.push(movement)
    sectionMovements

$ ->
  sechzig.blocking.initialize()
