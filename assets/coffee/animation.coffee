window.sechzig ?= {}

sechzig.animation =

  # play css initialize
  init: (movement) ->
    styles = {}
    styles.transition = "all #{movement.transition}s ease" if movement.transition
    styles.webkitFilter = "blur(#{movement.values.blur[0]}px)" if movement.values?.blur
    styles.opacity = movement.values.opacity[0] if movement.values?.opacity
    styles.transform = @formatTransformValue(movement) if movement.values?.transform
    @updateStyles(movement, styles)

  playCSS: (movement) ->
    styles = {}
    styles.webkitFilter = "blur(#{movement.values.blur[1]}px)" if movement.values?.blur
    styles.opacity = movement.values.opacity[1] if movement.values?.opacity
    styles.transform = @formatTransformValue(movement, true, false) if movement.values?.transform
    @updateStyles(movement, styles)

  scrubCSS: (movement) ->
    styles = {}
    styles.webkitFilter = "blur(#{sechzig.easing.quadInOut(movement.pixelProgress, movement.values?.blur[0], movement.values?.blur[1] - movement.values?.blur[0], movement.pixelDistance)}px)" if movement.values?.blur
    styles.opacity = sechzig.easing.quadInOut(movement.pixelProgress, movement.values?.opacity[0], movement.values?.opacity[1] - movement.values?.opacity[0], movement.pixelDistance) if movement.values?.opacity
    styles.transform = @formatTransformValue(movement, false, 'quadInOut') if movement.values?.transform
    @updateStyles(movement, styles)

  formatTransformValue: (movement, reverse = false, easing = false) ->
    index = ~~reverse # 0/1
    inverse = ~~!index
    transformations = []

    # validate easing
    if easing
      unless sechzig.easing[easing]
        console.log 'Invalid easing function provided!'
        easing = false

    # compute CSS transform property values
    props = movement.values?.transform

    if props?.translate
      transformations.push if easing
        "translate3d(#{sechzig.easing[easing](movement.pixelProgress, props.translate[index].x, props.translate[inverse].x - props.translate[index].x, movement.pixelDistance)}vw, #{sechzig.easing.quadInOut(movement.pixelProgress, props.translate[index].y, props.translate[inverse].y - props.translate[index].y, movement.pixelDistance)}vh, 0)"
      else
        "translate3d(#{props.translate[index].x}vw,#{props.translate[index].y}vh,0px)"

    if props?.rotate
      transformations.push if easing
        "rotate(#{sechzig.easing[easing](movement.pixelProgress, props.rotate[index], props.rotate[inverse] - props.rotate[index], movement.pixelDistance)}deg"
      else
        "rotate(#{props.rotate[index]}deg"

    if props?.scale
      transformations.push if easing
        "scale(#{sechzig.easing[easing](movement.pixelProgress, props.scale[index], props.scale[inverse] - props.scale[index], movement.pixelDistance)})"
      else
        "scale(#{props.scale[index]})"

    transformations.join(' ')

  updateStyles: (movement, styles) ->
    $("##{movement.cue}").find("#{movement.character}").css styles
