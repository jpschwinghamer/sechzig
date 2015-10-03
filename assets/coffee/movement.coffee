sechzig.movement =
  initialize: ->

  directMovement: (movement) ->
    switch movement.type
      when "animation"
        sechzig.movement.animateMovement(movement)
      when "video"
        movement.video = movement.object[0]
        sechzig.movement.playMovement(movement)

  animateMovement: (movement) ->
    $("##{movement.scene} #{movement.character}").css({
        'opacity' : sechzig.easing.quadInOut(movement.pixelProgress, movement.startValues.opacity, movement.finishValues.opacity - movement.startValues.opacity, movement.pixelDistance),
        'transform' :   "translate3d(
                        #{sechzig.easing.quadInOut(movement.pixelProgress, movement.startValues.translateX, movement.finishValues.translateX - movement.startValues.translateX, movement.pixelDistance)}vw,
                        #{sechzig.easing.quadInOut(movement.pixelProgress, movement.startValues.translateY, movement.finishValues.translateY - movement.startValues.translateY, movement.pixelDistance)}vh,
                        0)
                        rotate(
                        #{sechzig.easing.quadInOut(movement.pixelProgress, movement.startValues.rotate, movement.finishValues.rotate - movement.startValues.rotate, movement.pixelDistance)}deg)
                        scale(
                        #{sechzig.easing.quadInOut(movement.pixelProgress, movement.startValues.scale, movement.finishValues.scale - movement.startValues.scale, movement.pixelDistance)})"
      })

  playMovement: (movement) ->
    if movement.video.networkState == 1
      movement.video.currentTime = sechzig.easing.quadInOut(movement.pixelProgress, 0, movement.video.duration, movement.pixelDistance)

$ ->
 sechzig.movement.initialize()
