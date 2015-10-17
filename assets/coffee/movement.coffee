sechzig.movement =
  directMovement: (movement) ->
    switch movement.type
      when "scrub-css-animation"
        sechzig.animation.scrubCSS(movement)
      when "play-css-animation"
        sechzig.animation.playCSS(movement) unless movement.played
      when "scrub-video"
        sechzig.video.scrubVideo(movement)
      when "play-video"
        sechzig.video.playVideo(movement)
      when "scrub-canvas"
        sechzig.canvas.scrubCanvas(movement) if movement.canvasReady
      when "draw-canvas"
        sechzig.canvas.drawCanvas(movement) if movement.canvasReady
