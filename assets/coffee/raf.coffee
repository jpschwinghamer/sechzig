sechzig.raf =
  callbacks: []
  initialize: ->
    @rafBreak = false

  rafBreakCheck: ->
    if @rafBreak == false
      requestAnimationFrame(->
        $.each sechzig.raf.callbacks, ->
          @call()
        # Release the brake after callbacks
        sechzig.raf.rafBreak = false
      )
      # Put the brake on while the current frame completes
      sechzig.raf.rafBreak = true

  onScroll: (callback) ->
    @callbacks.push callback

$ ->
  sechzig.raf.initialize()
