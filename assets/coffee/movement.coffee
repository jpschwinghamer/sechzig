window.sechzig ?= {}

sechzig.movement =
  route: ($movement, i) ->
    switch $movement.data('keyframe-type')
      when "scrub-css"
        sechzig.animation.scrubCSS($movement, i)
    #   when "play-css"
    #     sechzig.animation.playCSS($movement)
      # when "scrub-video"
      #   sechzig.video.scrubVideo($movement, $cue)
      # when "play-video"
      #   sechzig.video.playVideo($movement, $cue)
      # when "scrub-canvas"
      #   sechzig.canvas.scrubCanvas($movement, $cue) if $movement.canvasReady
      # when "draw-canvas"
      #   sechzig.canvas.drawCanvas($movement, $cue) if $movement.canvasReady

  reset: ($movement) ->
    # switch $movement.data('keyframe-type')
    #   when "scrub-css"
    #     sechzig.animation.setCSS($movement)
    #   when "play-css"
    #     sechzig.animation.setCSS($movement)
