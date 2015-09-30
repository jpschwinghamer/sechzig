sechzig.raf =
  callbacks: []
  initialize: ->
    @rafLoop()

  rafLoop: ->
    requestAnimationFrame(->
      $.each sechzig.raf.callbacks, ->
        @call()
      sechzig.raf.rafLoop()
    )

  register: (callback) ->
    @callbacks.push callback

$ ->
  sechzig.raf.initialize()
