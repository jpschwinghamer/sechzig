sechzig.video =
  initialize: (movement) ->
    movement.video = movement.object[0]

  scrubVideo: (movement) ->
    if movement.video.networkState == 1
      movement.video.currentTime = sechzig.easing.quadInOut(movement.pixelProgress, 0, movement.video.duration, movement.pixelDistance)

  playVideo: (movement) ->
    if movement.video.networkState == 1
      movement.video.play()
    movement.object.on 'inactive', ->
      movement.video.pause()
