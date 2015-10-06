sechzig.blocking =
  initialize: ->
    @keyframes = sechzig.keyframes

  assignMovements: (scene) ->
    sceneMovements = []
    for movement in sechzig.blocking.keyframes
      if movement.scene == scene
        sechzig.blocking.setDefaultMovements(movement)
        sechzig.blocking.setMovementObject(movement)
        sechzig.video.initialize(movement) if (movement.type == "play-video" or movement.type == "scrub-video")
        sechzig.canvas.initialize(movement) if (movement.type == "scrub-canvas" or movement.type == "draw-canvas")
        sceneMovements.push(movement)
    sceneMovements

  setDefaultMovements: (movement) ->
    # Types
    unless movement.type?
      movement.type = "css-animation"

    # Animation defaults
    if movement.type == "css-animation"
      unless movement.startValues.opacity?
        movement.startValues.opacity = 1
      unless movement.startValues.translateX?
        movement.startValues.translateX = 0
      unless movement.startValues.translateY?
        movement.startValues.translateY = 0
      unless movement.startValues.rotate?
        movement.startValues.rotate = 0
      unless movement.startValues.scale?
        movement.startValues.scale = 1
      unless movement.finishValues.opacity?
        movement.finishValues.opacity = movement.startValues.opacity
      unless movement.finishValues.translateX?
        movement.finishValues.translateX = movement.startValues.translateX
      unless movement.finishValues.translateY?
        movement.finishValues.translateY = movement.startValues.translateY
      unless movement.finishValues.rotate?
        movement.finishValues.rotate = movement.startValues.rotate
      unless movement.finishValues.scale?
        movement.finishValues.scale = movement.startValues.scale

  getBlockingProgress: (scene) ->
    for movement in scene.blocking
      movement.startPixel = (movement.startTime * scene.duration) + scene.top
      movement.finishPixel = (movement.finishTime * scene.duration) + scene.top
      movement.pixelDistance = movement.finishPixel - movement.startPixel
      movement.pixelProgress = sechzig.scroll.scrollBottom - movement.startPixel
      if sechzig.blocking.status(movement)
        sechzig.movement.directMovement(movement)
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
