window.sechzig ?= {}

sechzig.movement =
  init: (movement, cue) ->
    switch movement.type
      when "play-css-animation"
        sechzig.animation.setCSS(movement, cue)
    cue.ready = true

  router: (movement, cue) ->
    if cue.ready
      switch movement.type
        when "scrub-css-animation"
          sechzig.animation.scrubCSS(movement, cue)
        when "play-css-animation"
          sechzig.animation.playCSS(movement, cue)
        when "scrub-video"
          sechzig.video.scrubVideo(movement, cue)
        when "play-video"
          sechzig.video.playVideo(movement, cue)
        when "scrub-canvas"
          sechzig.canvas.scrubCanvas(movement, cue) if movement.canvasReady
        when "draw-canvas"
          sechzig.canvas.drawCanvas(movement, cue) if movement.canvasReady
