window.sechzig ?= {}

sechzig.blocking =
  assignMovements: (cue) ->
    cueMovements = []
    for movement in sechzig.keyframes
      if movement.cue == cue
        cueMovements.push(movement)
    cueMovements

  init: ->
    for cue in sechzig.stage.cues
      for movement in cue.blocking
        movement.top = (movement.start * cue.duration) + cue.top
        movement.bottom = (movement.finish * cue.duration) + cue.top
        movement.duration = movement.bottom - movement.top

  monitorMovements: (cue) ->
    for movement in cue.blocking
      if @active(movement) then movement.active = true else movement.active = false
      @directMovement(movement, cue)

  active: (movement) ->
    movement.top < sechzig.scroll.scrollBottom && movement.bottom > sechzig.scroll.scrollBottom

  elapsed: (movement) ->
    movement.bottom < sechzig.scroll.scrollTop

  progress: (movement) ->
    sechzig.scroll.scrollBottom - movement.top

  directMovement: (movement, cue) ->
    if cue.active && !cue.ready
      sechzig.movement.init(movement, cue)
    if movement.active
      sechzig.movement.router(movement, cue)
      movement.progress = @progress(movement)
