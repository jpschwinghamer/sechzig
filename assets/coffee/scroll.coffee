sechzig.scroll =
  initialize: ->
    @scrollTop = 0
    @scrollHeight = $(window).height()
    @scrollBottom = @scrollHeight
    @enableBindings()
    sechzig.resize.register(sechzig.scroll.updateScroll)

  enableBindings: ->
    $(window).on 'scroll', ->
      sechzig.scroll.scrollTop = $(window).scrollTop()
      sechzig.scroll.scrollBottom = sechzig.scroll.scrollTop + sechzig.scroll.scrollHeight

  updateScroll: ->
    sechzig.scroll.scrollTop = $(window).scrollTop()
    sechzig.scroll.scrollHeight = $(window).height()
    sechzig.scroll.scrollBottom = sechzig.scroll.scrollTop + sechzig.scroll.scrollHeight
    sechzig.stage.arrangeCues()
    sechzig.cue.monitorCues()

$ ->
  sechzig.scroll.initialize()
