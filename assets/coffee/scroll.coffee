window.sechzig ?= {}

sechzig.scroll =
  init: ->
    @scrollHeight = $(window).height()
    @scrollTop = $(window).scrollTop()
    @scrollBottom = @scrollTop + @scrollHeight
    @enableBindings()

  enableBindings: ->
    $(window).on 'scroll.sechzig', =>
      @scrollTop = $(window).scrollTop()
      @scrollBottom = @scrollTop + @scrollHeight

    $(window).on 'sechzig-resize', (e) =>
      @onResize()

  disableBindings: ->
    $(window).off 'scroll.sechzig'

  onResize: ->
    @updateValues()
    sechzig.stage.init()
    sechzig.cue.monitorCues()

  updateValues: ->
    @scrollHeight = $(window).height()
    @scrollTop = $(window).scrollTop()
    @scrollBottom = @scrollTop + @scrollHeight

$ ->
  sechzig.scroll.init()
