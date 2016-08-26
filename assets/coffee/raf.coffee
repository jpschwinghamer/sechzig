window.sechzig ?= {}

sechzig.raf =
  start: ->
    @raf = requestAnimationFrame(=>
      $(document).trigger 'sechzig-raf'
      @start()
    )

  stop: ->
    cancelAnimationFrame(@raf)

$ ->
  sechzig.raf.start()
