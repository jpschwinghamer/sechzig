sechzig.blocking =
  initialize: ->
    @keyframes = sechzig.keyframes

  assignMovements: (cue) ->
    cueMovements = []
    for movement in sechzig.blocking.keyframes
      if movement.cue == cue
        sechzig.blocking.setDefaultMovements(movement)
        sechzig.blocking.setMovementObject(movement)
        sechzig.animation.initialize(movement) if (movement.type == "play-css-animation")
        sechzig.video.initialize(movement) if (movement.type == "play-video" or movement.type == "scrub-video")
        sechzig.canvas.initialize(movement) if (movement.type == "scrub-canvas" or movement.type == "draw-canvas")
        cueMovements.push(movement)
    cueMovements

  setDefaultMovements: (movement) ->
    # Global
    unless movement.movementIsActive?
      movement.movementIsActive = false
    unless movement.type?
      movement.type = "scrub-css-animation"
    unless movement.startTime?
      movement.startTime = 0
    unless movement.finishTime?
      movement.finishTime = 1
    unless movement.loop?
      movement.loop = false

    # Canvas defaults
    if movement.type == "draw-canvas"
      unless movement.canvasReady?
        movement.canvasReady = false

    # Video defaults
    if movement.type == "play-video"
      unless movement.muted?
        movement.muted = false

  getBlockingProgress: (cue) ->
    for movement in cue.blocking
      movement.startPixel = (movement.startTime * cue.duration) + cue.top
      movement.finishPixel = (movement.finishTime * cue.duration) + cue.top
      movement.pixelDistance = movement.finishPixel - movement.startPixel
      movement.pixelProgress = sechzig.scroll.scrollBottom - movement.startPixel
      if sechzig.blocking.status(movement)
        sechzig.movement.directMovement(movement)
        sechzig.blocking.setActive(movement)
      else
        sechzig.blocking.setInactive(movement)

  setMovementObject: (movement) ->
    movement.object = $("##{movement.cue + " " + movement.character}")

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
