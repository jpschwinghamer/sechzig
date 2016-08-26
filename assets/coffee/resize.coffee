window.sechzig ?= {}

sechzig.resize =
  init: ->
    @enableBindings()

  enableBindings: ->
    $(window).on 'resize.sechzig', (e) =>
      # debounce resize
      clearTimeout(@delayResize) if @delayResize
      @delayResize = setTimeout( =>
        $(document).trigger
          type: 'sechzig-resize'
          width: $(window).width()
          height: $(window).height()
      , 100)

  disableBindings: ->
    $(window).off 'resize.sechzig'

$ ->
  sechzig.resize.init()
