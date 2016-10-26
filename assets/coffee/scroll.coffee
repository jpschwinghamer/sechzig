window.sechzig ?= {}

sechzig.scroll =
  init: ->
    @stage = if sechzig.detector.iOS then $('.stage') else $(window)
    @scrollHeight = $(window).height()
    @scrollTop = @stage.scrollTop()
    @scrollBottom = @scrollTop + @scrollHeight
    @enableBindings()

  enableBindings: ->
    @stage.on 'scroll', =>
      @scrollTop = @stage.scrollTop()
      @scrollBottom = @scrollTop + @scrollHeight

    $(window).on 'resize', =>
      @update()

  update: ->
    @stage = if /iPad|iPhone|iPod/.test(navigator.userAgent) then $('.stage') else $(window)
    @scrollHeight = $(window).height()
    @scrollTop = @stage.scrollTop()
    @scrollBottom = @scrollTop + @scrollHeight
