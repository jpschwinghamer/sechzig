window.sechzig ?= {}

sechzig.cue =
  init: ->
    @enableBindings()

  enableBindings: ->
    $(document).on 'sechzig-raf', =>
      @monitorCues()

  disableBindings: ->
    $(document).off 'sechzig-raf'

  monitorCues: ->
    for cue in sechzig.stage.cues
      sechzig.backing.setCueClasp(cue) unless cue.clasp == false
      if @active(cue) then cue.active = true else cue.active = false
      @directCue(cue)

  active: (cue) ->
    cue.top <= sechzig.scroll.scrollBottom && cue.bottom >= sechzig.scroll.scrollTop

  elapsed: (cue) ->
    cue.bottom < sechzig.scroll.scrollTop

  progress: (cue) ->
    (sechzig.scroll.scrollBottom - cue.top)/cue.duration

  directCue: (cue) ->
    sechzig.blocking.monitorMovements(cue)
    cue.elapsed = @elapsed(cue)
    if cue.active
      cue.progress = @progress(cue)
    else
      cue.inverted = if cue.elapsed then true else false
      cue.ready = false

