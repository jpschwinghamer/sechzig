window.sechzig ?= {}

sechzig.resize =
  init: ->
    @enableBindings()

  enableBindings: ->
    $(window).on 'resize', (e) =>
      sechzig.scroll.update()
      sechzig.raf.stop()
      sechzig.stage.init()

$ ->
  sechzig.resize.init()
