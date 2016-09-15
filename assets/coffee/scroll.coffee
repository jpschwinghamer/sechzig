window.sechzig ?= {}

sechzig.scroll =
  init: ->
    @scrollHeight = $(window).height()
    @scrollTop = $(window).scrollTop()
    @scrollBottom = @scrollTop + @scrollHeight
    @enableBindings()

  enableBindings: ->
    $(window).on 'scroll', =>
      @scrollTop = $(window).scrollTop()
      @scrollBottom = @scrollTop + @scrollHeight

    $(window).on 'resize', =>
      @update()

  update: ->
    @scrollHeight = $(window).height()
    @scrollTop = $(window).scrollTop()
    @scrollBottom = @scrollTop + @scrollHeight

$ ->
  sechzig.scroll.init()
