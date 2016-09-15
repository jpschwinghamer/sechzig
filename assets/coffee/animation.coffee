window.sechzig ?= {}

sechzig.animation =

  setCSS: ($movement, $cue, start, direction) ->
    styles = {}
    styles.transition = "none"
    styles.webkitFilter = " blur(#{$movement.data('keyframe-blur')[start][direction]}px)" if $movement.data('keyframe-blur')
    styles.transform = ""
    if $movement.data('keyframe-translate')
      styles.transform = " translate3d(#{$movement.data('keyframe-translate')[start].x[direction]}vw, #{$movement.data('keyframe-translate')[start].y[direction]}vw, 0)"
    if $movement.data('keyframe-rotate')
      styles.transform += " rotate(#{$movement.data('keyframe-rotate')[start][direction]}deg)"
    if $movement.data('keyframe-scale')
      styles.transform += " scale(#{$movement.data('keyframe-scale')[start][direction]})"
    styles.opacity = $movement.data('keyframe-opacity')[start][direction] if $movement.data('keyframe-opacity')
    @updateStyles($movement, styles)

  playCSS: ($movement, $cue, index) ->
    # styles = {}
    # styles.transition = "all #{$movement.data('keyframe-duration')}s ease" if $movement.data('keyframe-duration')
    # styles.transform = ""
    # # if $movement.data('keyframe-translate')
    # #   styles.transform += " translate3d(#{$movement.data('keyframe-translate')[index].x[~~!$cue.data('completed')]}vw, #{$movement.data('keyframe-translate')[index].y[~~!$cue.data('completed')]}vw, 0)"
    # # if $movement.data('keyframe-rotate')
    # #   styles.transform += " rotate(#{$movement.data('keyframe-rotate')[index][~~!$cue.data('completed')]}deg)"
    # # if $movement.data('keyframe-scale')
    # #   styles.transform += " scale(#{$movement.data('keyframe-scale')[index][~~!$cue.data('completed')]})"
    # # styles.webkitFilter = "blur(#{$movement.data('keyframe-blur')[index][~~!$cue.data('completed')]}px)" if $movement.data('keyframe-blur')
    # styles.opacity = $movement.data('keyframe-opacity')[index][1] if $movement.data('keyframe-opacity')
    # @updateStyles($movement, styles)

  scrubCSS: ($movement, index) ->
    # styles = {}
    # styles.transition = "none"
    # styles.webkitFilter = "blur(#{sechzig.easing.quadInOut($movement.data('progress')[index], $movement.data('keyframe-blur')[index][0], $movement.data('keyframe-blur')[index][1] - $movement.data('keyframe-blur')[index][0], $movement.data('duration')[index])}px)" if $movement.data('keyframe-blur')
    # styles.opacity = sechzig.easing.quadInOut($movement.data('progress')[index], $movement.data('keyframe-opacity')[index][0], $movement.data('keyframe-opacity')[index][1] - $movement.data('keyframe-opacity')[index][0], $movement.data('duration')[index]) if $movement.data('keyframe-opacity')
    # styles.transform = ""
    # if $movement.data('keyframe-translate')
    #   styles.transform += " translate3d(#{sechzig.easing.quadInOut($movement.data('progress')[index], $movement.data('keyframe-translate')[index].x[0], $movement.data('keyframe-translate')[index].x[1] - $movement.data('keyframe-translate')[index].x[0], $movement.data('duration')[index])}vw, #{sechzig.easing.quadInOut($movement.data('progress')[index], $movement.data('keyframe-translate')[index].y[0], $movement.data('keyframe-translate')[index].y[1] - $movement.data('keyframe-translate')[index].y[0], $movement.data('duration')[index])}vh, 0)"
    # if $movement.data('keyframe-rotate')
    #   styles.transform += " rotate(#{sechzig.easing.quadInOut($movement.data('progress')[index], $movement.data('keyframe-rotate')[index][0], $movement.data('keyframe-rotate')[index][1] - $movement.data('keyframe-rotate')[index][0], $movement.data('duration')[index])}deg)"
    # if $movement.data('keyframe-scale')
    #   styles.transform += " scale(#{sechzig.easing.quadInOut($movement.data('progress')[index], $movement.data('keyframe-scale')[index][0], $movement.data('keyframe-scale')[index][1] - $movement.data('keyframe-scale')[index][0], $movement.data('duration')[index])})"
    # @updateStyles($movement, styles)

  updateStyles: ($movement, styles) ->
    $movement.css styles
