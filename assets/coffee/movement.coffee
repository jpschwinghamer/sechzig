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
      'opacity':      movement.finishValues.opacity * movement.progress + movement.startValues.opacity,
      'transform' :   "translate3d(
                        #{movement.finishValues.translateX * movement.progress + movement.startValues.translateX}vw,
                        #{movement.finishValues.translateY * movement.progress + movement.startValues.translateY}vh,
                        0)
                      rotate(
                        #{movement.finishValues.rotate * movement.progress + movement.startValues.rotate}deg)
                      scale(
                        #{movement.finishValues.scale * movement.progress + movement.startValues.scale})"
    })


$ ->
 sechzig.movement.initialize()
