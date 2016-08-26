window.sechzig ?= {}

sechzig.animation =

  # play css initialize
  init: (movement) ->
    $character = $("##{movement.cue}").find("#{movement.character}")

    styles = {}

    # set transition
    if movement.transition
      styles.transition = "all #{movement.transition}s ease"

    # compute blur
    if movement.values?.blur
      styles.webkitFilter = "blur(#{movement.values.blur[0]}px)"

    # compute opacity
    if movement.values?.opacity
      opacity = movement.values.opacity[0]

    # compute transforms
    if movement.values?.transform
        styles.transform = ""
    if movement.values?.transform?.translate
      styles.transform += "translate3d(#{movement.values.transform.translate[0].x}vw,#{movement.values.transform.translate[0].y}vh,0px)"
    if movement.values?.transform?.rotate
      styles.transform += "rotate(#{movement.values.transform.rotate[0]}deg"
    if movement.values?.transform?.scale
      styles.transform += "scale(#{movement.values.transform.scale[0]})"

    $character.css styles

  playCSS: (movement) ->
    $character = $("##{movement.cue}").find("#{movement.character}")
    styles = {}

    # compute blur
    if movement.values?.blur
      styles.webkitFilter = "blur(#{movement.values.blur[1]}px)"

    # compute opacity
    if movement.values?.opacity
      opacity = movement.values.opacity[1]

    # compute transforms
    if movement.values?.transform
        styles.transform = ""
    if movement.values?.transform?.translate
      styles.transform += "translate3d(#{movement.values.transform.translate[1].x}vw,#{movement.values.transform.translate[1].y}vh,0px)"
    if movement.values?.transform?.rotate
      styles.transform += "rotate(#{movement.values.transform.rotate[1]}deg"
    if movement.values?.transform?.scale
      styles.transform += "scale(#{movement.values.transform.scale[1]})"

    $character.css styles

  scrubCSS: (movement) ->
    $character = $("##{movement.cue}").find("#{movement.character}")
    styles = {}

    # compute blur
    if movement.values?.blur
      styles.webkitFilter = "blur(#{sechzig.easing.quadInOut(movement.pixelProgress, movement.values?.blur[0], movement.values?.blur[1] - movement.values?.blur[0], movement.pixelDistance)}px)"

    # compute opacity
    if movement.values?.opacity
      styles.opacity = sechzig.easing.quadInOut(movement.pixelProgress, movement.values?.opacity[0], movement.values?.opacity[1] - movement.values?.opacity[0], movement.pixelDistance)

    # compute transforms
    if movement.values?.transform
      styles.transform = ""
    if movement.values?.transform?.translate
      styles.transform += "translate3d(#{sechzig.easing.quadInOut(movement.pixelProgress, movement.values?.transform.translate[0].x, movement.values?.transform.translate[1].x - movement.values?.transform.translate[0].x, movement.pixelDistance)}vw, #{sechzig.easing.quadInOut(movement.pixelProgress, movement.values?.transform.translate[0].y, movement.values?.transform.translate[1].y - movement.values?.transform.translate[0].y, movement.pixelDistance)}vh, 0) "
    if movement.values?.transform?.rotate
      styles.transform += "rotate(#{sechzig.easing.quadInOut(movement.pixelProgress, movement.values?.transform.rotate[0], movement.values?.transform.rotate[1] - movement.values?.transform.rotate[0], movement.pixelDistance)}deg "
    if movement.values?.transform?.scale
      styles.transform += "scale(#{sechzig.easing.quadInOut(movement.pixelProgress, movement.values?.transform.scale[0], movement.values?.transform.scale[1] - movement.values?.transform.scale[0], movement.pixelDistance)}) "

    # apply styles
    $character.css styles
