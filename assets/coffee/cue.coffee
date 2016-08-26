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
      if @status(cue)
        @setActive(cue)
        @directActiveCues(cue)
      else
        @setInactive(cue)

  status: (cue) ->
    (sechzig.scroll.scrollTop >= cue.top and sechzig.scroll.scrollTop <= cue.bottom) or
    (sechzig.scroll.scrollBottom >= cue.top and sechzig.scroll.scrollBottom <= cue.bottom)

  directActiveCues: (cue) ->
    @getCueProgress(cue)
    sechzig.blocking.getBlockingProgress(cue)

  getCueProgress: (cue) ->
    cue.progress = (sechzig.scroll.scrollBottom - cue.top)/cue.duration

  setActive: (cue) ->
    cue.object.trigger('active') unless cue.cueIsActive
    cue.cueIsActive = true

  setInactive: (cue) ->
    cue.object.trigger('inactive') if cue.cueIsActive
    cue.cueIsActive = false

$ ->
  sechzig.cue.init()
