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

  register: (callback) ->
    @callbacks.push callback

$ ->
  sechzig.resize.initialize()
