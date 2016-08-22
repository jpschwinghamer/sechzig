sechzig.video =
  initialize: (movement) ->
    movement.video = movement.object[0]
    movement.object.prop('loop', movement.loop)
    movement.object.prop('muted', movement.muted)
    $('video')[0].currentTime = 0 if movement.video.duration

  scrubVideo: (movement) ->
    if movement.video.duration
      movement.video.currentTime = sechzig.easing.quadInOut(movement.pixelProgress, 0, movement.video.duration, movement.pixelDistance)

  playVideo: (movement) ->
    if movement.video.networkState == 1 && movement.video.duration
      movement.video.play()
    movement.object.on 'inactive', ->
      movement.video.pause()
