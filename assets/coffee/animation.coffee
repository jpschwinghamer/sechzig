window.sechzig ?= {}

sechzig.animation =

  setCSS: (movement, cue) ->
    styles = {}
    styles.transition = "none"
    styles.webkitFilter = "blur(#{movement.values.blur[~~cue.inverted]}px)" if movement.values?.blur
    styles.opacity = movement.values.opacity[~~cue.inverted] if movement.values?.opacity
    if movement.values?.transform
      styles.transform = ""
    if movement.values?.transform?.translate
      styles.transform = "translate3d(#{movement.values?.transform.translate[~~cue.inverted].x}vw, #{movement.values?.transform.translate[~~cue.inverted].y}vw, 0)"
    if movement.values?.transform?.rotate
      styles.transform += "rotate(#{movement.values?.transform.rotate[~~cue.inverted]}deg)"
    if movement.values?.transform?.scale
      styles.transform += "scale(#{movement.values?.transform.scale[~~cue.inverted]})"
    @updateStyles(movement, styles)

  playCSS: (movement, cue) ->
    styles = {}
    styles.transition = "all #{movement.transition}s ease" if movement.transition
    if movement.values?.transform
      styles.transform = ""
    if movement.values?.transform?.translate
      styles.transform = "translate3d(#{movement.values?.transform.translate[~~!cue.inverted].x}vw, #{movement.values?.transform.translate[~~!cue.inverted].y}vw, 0)"
    if movement.values?.transform?.rotate
      styles.transform += "rotate(#{movement.values?.transform.rotate[~~!cue.inverted]}deg)"
    if movement.values?.transform?.scale
      styles.transform += "scale(#{movement.values?.transform.scale[~~!cue.inverted]})"
    styles.webkitFilter = "blur(#{movement.values.blur[~~!cue.inverted]}px)" if movement.values?.blur
    styles.opacity = movement.values.opacity[~~!cue.inverted] if movement.values?.opacity
    @updateStyles(movement, styles)

  scrubCSS: (movement) ->
    styles = {}
    styles.webkitFilter = "blur(#{sechzig.easing.quadInOut(movement.progress, movement.values?.blur[0], movement.values?.blur[1] - movement.values?.blur[0], movement.duration)}px)" if movement.values?.blur
    styles.opacity = sechzig.easing.quadInOut(movement.progress, movement.values?.opacity[0], movement.values?.opacity[1] - movement.values?.opacity[0], movement.duration) if movement.values?.opacity
    if movement.values?.transform
      styles.transform = ""
    if movement.values?.transform?.translate
      styles.transform = "translate3d(#{sechzig.easing.quadInOut(movement.progress, movement.values?.transform.translate[0].x, movement.values?.transform.translate[1].x - movement.values?.transform.translate[0].x, movement.duration)}vw, #{sechzig.easing.quadInOut(movement.progress, movement.values?.transform.translate[0].y, movement.values?.transform.translate[1].y - movement.values?.transform.translate[0].y, movement.duration)}vh, 0)"
    if movement.values?.transform?.rotate
      styles.transform += "rotate(#{sechzig.easing.quadInOut(movement.progress, movement.values?.transform.rotate[0], movement.values?.transform.rotate[1] - movement.values?.transform.rotate[0], movement.duration)}deg"
    if movement.values?.transform?.scale
      styles.transform += "scale(#{sechzig.easing.quadInOut(movement.progress, movement.values?.transform.scale[0], movement.values?.transform.scale[1] - movement.values?.transform.scale[0], movement.duration)})"
    @updateStyles(movement, styles)

  updateStyles: (movement, styles) ->
    $("##{movement.cue}").find("#{movement.character}").css styles
