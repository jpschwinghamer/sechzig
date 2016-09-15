window.sechzig ?= {}

sechzig.raf =
  start: ->
    @raf = requestAnimationFrame(=>
      sechzig.cue.monitor()
      sechzig.blocking.monitor()
      @start()
    )

  stop: ->
    cancelAnimationFrame(@raf)
