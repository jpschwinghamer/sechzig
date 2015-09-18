sechzig.movement =
  initialize: ->

  animateMovement: (scene, movement) ->
    $("##{scene.id} #{movement.character}").css({
      'opacity':      movement.finishValues.opacity * movement.progress + movement.startValues.opacity,
      'transform' :   "translate3d(
                        #{movement.finishValues.translateX * movement.progress + movement.startValues.translateX}vw,
                        #{movement.finishValues.translateY * movement.progress + movement.startValues.translateY}vh,
                        0)
                      rotate(
                        #{movement.finishValues.rotate * movement.progress + movement.startValues.rotate}deg)"
    })


$ ->
 sechzig.movement.initialize()
