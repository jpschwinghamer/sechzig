sechzig.resize =
  callbacks: []
  initialize: ->
    @enableBindings()

  enableBindings: ->
    $(window).on 'resize', ->
      sechzig.resize.recalcLayout()

  recalcLayout: ->
    $.each @callbacks, ->
      @call()

  onResize: (callback) ->
    @callbacks.push callback

$ ->
  sechzig.resize.initialize()
