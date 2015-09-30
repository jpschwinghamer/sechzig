sechzig.movement =
  initialize: ->

  setDefaultMovements: (movement) ->
    unless movement.startValues.opacity?
      movement.startValues.opacity = 1
    unless movement.startValues.translateX?
      movement.startValues.translateX = 0
    unless movement.startValues.translateY?
      movement.startValues.translateY = 0
    unless movement.startValues.rotate?
      movement.startValues.rotate = 0
    unless movement.startValues.scale?
      movement.startValues.scale = 1
    unless movement.finishValues.opacity?
      movement.finishValues.opacity = movement.startValues.opacity
    unless movement.finishValues.translateX?
      movement.finishValues.translateX = movement.startValues.translateX
    unless movement.finishValues.translateY?
      movement.finishValues.translateY = movement.startValues.translateY
    unless movement.finishValues.rotate?
      movement.finishValues.rotate = movement.startValues.rotate
    unless movement.finishValues.scale?
      movement.finishValues.scale = movement.startValues.scale

  animateMovement: (scene, movement) ->
    $("##{scene.id} #{movement.character}").css({
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

$ ->
 sechzig.movement.initialize()
