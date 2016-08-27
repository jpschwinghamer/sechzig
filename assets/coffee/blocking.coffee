window.sechzig ?= {}

sechzig.blocking =
  assignMovements: (cue) ->
    cueMovements = []
    for movement in sechzig.keyframes
      if movement.cue == cue
        sechzig.blocking.setDefaultMovements(movement)
        sechzig.blocking.setMovementObject(movement)
        sechzig.animation.init(movement) if (movement.type == "play-css-animation")
        sechzig.video.init(movement) if (movement.type == "play-video" or movement.type == "scrub-video")
        sechzig.canvas.init(movement) if (movement.type == "scrub-canvas" or movement.type == "draw-canvas")
        cueMovements.push(movement)
    cueMovements

  setDefaultMovements: (movement) ->
    movement.movementIsActive ?= false
    movement.type ?= "scrub-css-animation"
    movement.startTime ?= 0
    movement.finishTime ?= 1
    movement.loop ?= false

    # Canvas defaults
    movement.canvasReady ?= false if movement.type == "draw-canvas"

    # Video defaults
    movement.muted ?= false if movement.type == "play-video"

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
