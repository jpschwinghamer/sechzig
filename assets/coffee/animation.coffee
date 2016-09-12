window.sechzig ?= {}

sechzig.animation =

  setCSS: ($movement) ->
    styles = {}
    styles.transition = "all #{$movement.data('keyframe-duration')}s ease" if $movement.data('keyframe-duration')
    styles.webkitFilter = " blur(#{$movement.data('keyframe-blur')[~~$movement.data('elapsed')]}px)" if $movement.data('keyframe-blur')
    styles.transform = ""
    if $movement.data('keyframe-translate')
      styles.transform = " translate3d(#{$movement.data('keyframe-translate').x[~~$movement.data('elapsed')]}vw, #{$movement.data('keyframe-translate').y[~~$movement.data('elapsed')]}vw, 0)"
    if $movement.data('keyframe-rotate')
      styles.transform += " rotate(#{$movement.data('keyframe-rotate')[~~$movement.data('elapsed')]}deg)"
    if $movement.data('keyframe-scale')
      styles.transform += " scale(#{$movement.data('keyframe-scale')[~~$movement.data('elapsed')]})"
    styles.opacity = $movement.data('keyframe-opacity')[~~$movement.data('elapsed')] if $movement.data('keyframe-opacity')
    @updateStyles($movement, styles)

  playCSS: ($movement) ->
    styles = {}
    styles.transition = "all #{$movement.data('keyframe-duration')}s ease" if $movement.data('keyframe-duration')
    styles.transform = ""
    if $movement.data('keyframe-translate')
      styles.transform += " translate3d(#{$movement.data('keyframe-translate').x[~~!$movement.data('elapsed')]}vw, #{$movement.data('keyframe-translate').y[~~!$movement.data('elapsed')]}vw, 0)"
    if $movement.data('keyframe-rotate')
      styles.transform += " rotate(#{$movement.data('keyframe-rotate')[~~!$movement.data('elapsed')]}deg)"
    if $movement.data('keyframe-scale')
      styles.transform += " scale(#{$movement.data('keyframe-scale')[~~!$movement.data('elapsed')]})"
    styles.webkitFilter = "blur(#{$movement.data('keyframe-blur')[~~!$movement.data('elapsed')]}px)" if $movement.data('keyframe-blur')
    styles.opacity = $movement.data('keyframe-opacity')[~~!$movement.data('elapsed')] if $movement.data('keyframe-opacity')
    @updateStyles($movement, styles)

  scrubCSS: ($movement, i) ->
    console.log "scrubbing movement #{i}"
    styles = {}
    styles.transition = "none"
    styles.webkitFilter = "blur(#{sechzig.easing.quadInOut($movement.data('progress')[i], $movement.data('keyframe-blur')[i][0], $movement.data('keyframe-blur')[i][1] - $movement.data('keyframe-blur')[i][0], $movement.data('duration')[i])}px)" if $movement.data('keyframe-blur')[i]
    styles.opacity = sechzig.easing.quadInOut($movement.data('progress')[i], $movement.data('keyframe-opacity')[i][0], $movement.data('keyframe-opacity')[i][1] - $movement.data('keyframe-opacity')[i][0], $movement.data('duration')[i]) if $movement.data('keyframe-opacity')[i]
    styles.transform = ""
    if $movement.data('keyframe-translate')[i]
      styles.transform += " translate3d(#{sechzig.easing.quadInOut($movement.data('progress')[i], $movement.data('keyframe-translate')[i].x[0], $movement.data('keyframe-translate')[i].x[1] - $movement.data('keyframe-translate')[i].x[0], $movement.data('duration')[i])}vw, #{sechzig.easing.quadInOut($movement.data('progress')[i], $movement.data('keyframe-translate')[i].y[0], $movement.data('keyframe-translate')[i].y[1] - $movement.data('keyframe-translate')[i].y[0], $movement.data('duration')[i])}vh, 0)"
    if $movement.data('keyframe-rotate')[i]
      styles.transform += " rotate(#{sechzig.easing.quadInOut($movement.data('progress')[i], $movement.data('keyframe-rotate')[i][0], $movement.data('keyframe-rotate')[i][1] - $movement.data('keyframe-rotate')[i][0], $movement.data('duration')[i])}deg)"
    if $movement.data('keyframe-scale')[i]
      styles.transform += " scale(#{sechzig.easing.quadInOut($movement.data('progress')[i], $movement.data('keyframe-scale')[i][0], $movement.data('keyframe-scale')[i][1] - $movement.data('keyframe-scale')[i][0], $movement.data('duration')[i])})"
    @updateStyles($movement, styles)

  updateStyles: ($movement, styles) ->
    $movement.css styles
