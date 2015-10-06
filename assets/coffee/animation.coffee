window.sechzig ||= {}

sechzig.animation =
  animateCSS: (movement) ->
    $("##{movement.scene} #{movement.character}").css
        opacity : sechzig.easing.quadInOut(movement.pixelProgress, movement.startValues.opacity, movement.finishValues.opacity - movement.startValues.opacity, movement.pixelDistance)
        transform :   "translate3d(
                        #{sechzig.easing.quadInOut(movement.pixelProgress, movement.startValues.translateX, movement.finishValues.translateX - movement.startValues.translateX, movement.pixelDistance)}vw,
                        #{sechzig.easing.quadInOut(movement.pixelProgress, movement.startValues.translateY, movement.finishValues.translateY - movement.startValues.translateY, movement.pixelDistance)}vh,
                        0)
                        rotate(
                        #{sechzig.easing.quadInOut(movement.pixelProgress, movement.startValues.rotate, movement.finishValues.rotate - movement.startValues.rotate, movement.pixelDistance)}deg)
                        scale(
                        #{sechzig.easing.quadInOut(movement.pixelProgress, movement.startValues.scale, movement.finishValues.scale - movement.startValues.scale, movement.pixelDistance)})"
