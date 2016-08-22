sechzig.cue =
  initialize: ->
    sechzig.raf.register(sechzig.cue.monitorCues)

  monitorCues: ->
    for cue in sechzig.stage.cues
      sechzig.backing.setCueClasp(cue) unless cue.clasp == false
      if sechzig.cue.status(cue)
        sechzig.cue.setActive(cue)
        sechzig.cue.directActiveCues(cue)
      else
        sechzig.cue.setInactive(cue)

  status: (cue) ->
    (sechzig.scroll.scrollTop >= cue.top and sechzig.scroll.scrollTop <= cue.bottom) or
    (sechzig.scroll.scrollBottom >= cue.top and sechzig.scroll.scrollBottom <= cue.bottom)

  directActiveCues: (cue) ->
    sechzig.cue.getCueProgress(cue)
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
  sechzig.cue.initialize()
