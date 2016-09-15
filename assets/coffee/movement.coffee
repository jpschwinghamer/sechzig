window.sechzig ?= {}

sechzig.movement =
  route: ($movement, $cue, index) ->
    # switch $movement.data('keyframe-type')
    #   when "scrub-css"
    #     sechzig.animation.scrubCSS($movement, index)
    #   when "play-css"
    #     sechzig.animation.playCSS($movement, $cue, index)
      # when "scrub-video"
      #   sechzig.video.scrubVideo($movement, $cue)
      # when "play-video"
      #   sechzig.video.playVideo($movement, $cue)
      # when "scrub-canvas"
      #   sechzig.canvas.scrubCanvas($movement, $cue) if $movement.canvasReady
      # when "draw-canvas"
      #   sechzig.canvas.drawCanvas($movement, $cue) if $movement.canvasReady

  reset: ($movement, $cue, start, direction) ->
    switch $movement.data('keyframe-type')
      when "scrub-css"
        console.log direction
        sechzig.animation.setCSS($movement, $cue, start, direction)
      # when "play-css"
      #   sechzig.animation.setCSS($movement, $cue, index, direction)
