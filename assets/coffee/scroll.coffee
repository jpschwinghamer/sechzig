sechzig.scroll =
  initialize: ->
    @scrollTop = 0
    @scrollHeight = $(window).height()
    @scrollBottom = @scrollHeight
    @enableBindings()
    sechzig.resize.onResize(sechzig.scroll.updateScroll)

  enableBindings: ->
    $(window).on 'scroll', ->
      sechzig.scroll.scrollTop = $(window).scrollTop()
      sechzig.scroll.scrollBottom = sechzig.scroll.scrollTop + sechzig.scroll.scrollHeight
      sechzig.raf.rafBreakCheck()

  updateScroll: ->
    sechzig.scroll.scrollTop = $(window).scrollTop()
    sechzig.scroll.scrollHeight = $(window).height()
    sechzig.scroll.scrollBottom = sechzig.scroll.scrollTop + sechzig.scroll.scrollHeight
    # TODO - figure out how to better manage the sequencing here
    # Probably shouldn't be calling these here
    sechzig.stage.arrangeScenes()
    sechzig.scene.monitorScenes()

$ ->
  sechzig.scroll.initialize()
