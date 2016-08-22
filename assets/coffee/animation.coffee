window.sechzig ||= {}

sechzig.animation =
  initialize: (movement) ->
    character = $("##{movement.cue} #{movement.character}")
    blur = ""
    opacity = ""
    translate = ""
    rotate = ""
    scale = ""
    easing = "cubic-bezier(0.65, 0.05, 0.36, 1)"
    delay = 0
    if movement.values.blur?
      blur = "blur(#{movement.values.blur[0]})"
    if movement.values.opacity?
      opacity = movement.values.opacity[0]
    if movement.values.transform?
      if movement.values.transform.translate?
        translate = "translate3d(#{movement.values.transform.translate[0].x}vw,#{movement.values.transform.translate[0].y}vh,0)"
      if movement.values.transform.rotate?
        rotate = "rotate(#{movement.values.transform.rotate[0]}deg"
      if movement.values.transform.scale?
        scale = "scale(#{movement.values.transform.scale[0]})"
      if movement.delay?
        delay = movement.delay
    character.css
      webkitFilter: blur
      opacity: opacity
      transform: "#{scale} #{translate} #{rotate}"
    movement.object.one 'active', ->
      movement.played = true
      character.css
        transition: "all #{movement.duration}s #{easing} #{delay}s"
    movement.object.one 'inactive', ->
      character.css
        transition: "none"

  scrubCSS: (movement) ->
    character = $("##{movement.cue} #{movement.character}")
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

  playCSS: (movement) ->
    character = $("##{movement.cue} #{movement.character}")
    blur = ""
    opacity = ""
    translate = ""
    rotate = ""
    scale = ""
    if movement.values.blur?
        blur = "blur(#{movement.values.blur[1]})"
    if movement.values.opacity?
      opacity = movement.values.opacity[1]
    if movement.values.transform?
      if movement.values.transform.translate?
        translate = "translate3d(#{movement.values.transform.translate[1].x}vw,#{movement.values.transform.translate[1].y}vh,0)"
      if movement.values.transform.rotate?
        rotate = "rotate(#{movement.values.transform.rotate[1]}deg"
      if movement.values.transform.scale?
        scale = "scale(#{movement.values.transform.scale[1]})"
    character.css
      webkitFilter: blur
      opacity: opacity
      transform: "#{scale} #{translate} #{rotate}"
