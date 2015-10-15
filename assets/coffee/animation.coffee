window.sechzig ||= {}

sechzig.animation =
  animateCSS: (movement) ->
    character = $("##{movement.scene} #{movement.character}")
    blur = ""
    opacity = ""
    translate = ""
    rotate = ""
    scale = ""
    if movement.values.blur?
      blur = "blur(#{sechzig.easing.quadInOut(movement.pixelProgress, movement.values.blur[0], movement.values.blur[1] - movement.values.blur[0], movement.pixelDistance)}px)"
    if movement.values.opacity?
      opacity = sechzig.easing.quadInOut(movement.pixelProgress, movement.values.opacity[0], movement.values.opacity[1] - movement.values.opacity[0], movement.pixelDistance)
    if movement.values.transform?
      if movement.values.transform.translate?
        translate =   "translate3d(
                      #{sechzig.easing.quadInOut(movement.pixelProgress, movement.values.transform.translate[0].x, movement.values.transform.translate[1].x - movement.values.transform.translate[0].x, movement.pixelDistance)}vw,
                      #{sechzig.easing.quadInOut(movement.pixelProgress, movement.values.transform.translate[0].y, movement.values.transform.translate[1].y - movement.values.transform.translate[0].y, movement.pixelDistance)}vh,
                      0)
                      "
      if movement.values.transform.rotate?
        rotate =   "rotate(#{sechzig.easing.quadInOut(movement.pixelProgress, movement.values.transform.rotate[0], movement.values.transform.rotate[1] - movement.values.transform.rotate[0], movement.pixelDistance)}deg"
      if movement.values.transform.scale?
        scale =   "scale(#{sechzig.easing.quadInOut(movement.pixelProgress, movement.values.transform.scale[0], movement.values.transform.scale[1] - movement.values.transform.scale[0], movement.pixelDistance)})"
    character.css
      webkitFilter: blur
      opacity: opacity
      transform: "#{scale} #{translate} #{rotate}"
