window.sechzig ?= {}

sechzig.animation =
  play: ($movement, i, direction, duration, delay = 0) ->
    keyframes = []
    for j in [0..1]
      styles = {}
      styles.transform = ""
      if $movement.data('keyframe-translate')?
        valueX = parseInt(sechzig.caliper.value($movement.data('keyframe-translate')[i].x[j]))
        valueY = parseInt(sechzig.caliper.value($movement.data('keyframe-translate')[i].y[j]))
        unitX = sechzig.caliper.unit($movement.data('keyframe-translate')[i].x[0])
        unitY = sechzig.caliper.unit($movement.data('keyframe-translate')[i].y[0])
        styles.transform += " translate3d(#{valueX}#{unitX}, #{valueY}#{unitY}, 0)"
      if $movement.data('keyframe-rotate')?
        styles.transform += " rotate(#{$movement.data('keyframe-rotate')[i][j]}deg)"
      if $movement.data('keyframe-scale')?
        styles.transform += " scale(#{$movement.data('keyframe-scale')[i][j]})"
      styles.opacity = $movement.data('keyframe-opacity')[i][j] if $movement.data('keyframe-opacity')
      styles.webkitFilter = "blur(#{$movement.data('keyframe-blur')[i][j]}px)" if $movement.data('keyframe-blur')
      keyframes.push(styles)
    animation = $movement[0].animate( keyframes , { duration: duration, fill: 'forwards', direction: direction, easing: 'ease-in-out', delay: delay} )

  scrub: ($movement, i, progress) ->
    el = $movement[0]
    el.style.webkitFilter = "blur(#{sechzig.easing.quadInOut(progress, $movement.data('keyframe-blur')[i][0], $movement.data('keyframe-blur')[i][1] - $movement.data('keyframe-blur')[i][0], $movement.data('duration')[i])}px)" if $movement.data('keyframe-blur')
    el.style.opacity = sechzig.easing.quadInOut(progress, $movement.data('keyframe-opacity')[i][0], $movement.data('keyframe-opacity')[i][1] - $movement.data('keyframe-opacity')[i][0], $movement.data('duration')[i]) if $movement.data('keyframe-opacity')
    el.style.transform = ""
    if $movement.data('keyframe-translate')?
      duration = $movement.data('duration')[i]
      startValueX = parseInt(sechzig.caliper.value($movement.data('keyframe-translate')[i].x[0]))
      finishValueX = parseInt(sechzig.caliper.value($movement.data('keyframe-translate')[i].x[1]))
      valueChangeX = parseInt(finishValueX - startValueX)
      startValueY = parseInt(sechzig.caliper.value($movement.data('keyframe-translate')[i].y[0]))
      finishValueY = parseInt(sechzig.caliper.value($movement.data('keyframe-translate')[i].y[1]))
      valueChangeY = parseInt(finishValueY - startValueY)
      unitX = sechzig.caliper.unit($movement.data('keyframe-translate')[i].x[0])
      unitY = sechzig.caliper.unit($movement.data('keyframe-translate')[i].y[0])
      if $movement.data('keyframe-rounding')?
        el.style.transform += " translate3d(#{Math.round(sechzig.easing.quadInOut(progress, startValueX, valueChangeX, duration) )}#{unitX}, #{Math.round(sechzig.easing.quadInOut(progress, startValueY, valueChangeY, duration) )}#{unitY}, 0)"
      else
        el.style.transform += " translate3d(#{sechzig.easing.quadInOut(progress, startValueX, valueChangeX, duration)}#{unitX}, #{sechzig.easing.quadInOut(progress, startValueY, valueChangeY, duration)}#{unitY}, 0)"
    if $movement.data('keyframe-rotate')?
      el.style.transform += " rotate(#{sechzig.easing.quadInOut(progress, $movement.data('keyframe-rotate')[i][0], $movement.data('keyframe-rotate')[i][1] - $movement.data('keyframe-rotate')[i][0], $movement.data('duration')[i])}deg)"
    if $movement.data('keyframe-scale')?
      el.style.transform += " scale(#{sechzig.easing.quadInOut(progress, $movement.data('keyframe-scale')[i][0], $movement.data('keyframe-scale')[i][1] - $movement.data('keyframe-scale')[i][0], $movement.data('duration')[i])})"

  set: ($movement, i, direction) ->
    el = $movement[0]
    el.style.webkitFilter = " blur(#{$movement.data('keyframe-blur')[i][direction]}px)" if $movement.data('keyframe-blur')
    el.style.transform = ""
    if $movement.data('keyframe-translate')?
      valueX = parseInt(sechzig.caliper.value($movement.data('keyframe-translate')[i].x[direction]))
      valueY = parseInt(sechzig.caliper.value($movement.data('keyframe-translate')[i].y[direction]))
      unitX = sechzig.caliper.unit($movement.data('keyframe-translate')[i].x[0])
      unitY = sechzig.caliper.unit($movement.data('keyframe-translate')[i].y[0])
      el.style.transform = " translate3d(#{valueX}#{unitX}, #{valueY}#{unitY}, 0)"
    if $movement.data('keyframe-rotate')?
      el.style.transform += " rotate(#{$movement.data('keyframe-rotate')[i][direction]}deg)"
    if $movement.data('keyframe-scale')?
      el.style.transform += " scale(#{$movement.data('keyframe-scale')[i][direction]})"
    el.style.opacity = $movement.data('keyframe-opacity')[i][direction] if $movement.data('keyframe-opacity')
