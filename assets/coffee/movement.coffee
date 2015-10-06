sechzig.movement =
  directMovement: (movement) ->
    switch movement.type
      when "css-animation"
        sechzig.animation.animateCSS(movement)
      when "scrub-video"
        sechzig.video.scrubVideo(movement)
      when "play-video"
        sechzig.video.playVideo(movement) unless movement.movementIsActive
      when "scrub-canvas"
        sechzig.canvas.scrubCanvas(movement)
