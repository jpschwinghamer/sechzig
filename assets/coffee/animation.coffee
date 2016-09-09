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

  scrubCSS: ($movement) ->
    styles = {}
    styles.transition = "none"
    styles.webkitFilter = "blur(#{sechzig.easing.quadInOut($movement.data('progress'), $movement.data('keyframe-blur')[0], $movement.data('keyframe-blur')[1] - $movement.data('keyframe-blur')[0], $movement.data('duration'))}px)" if $movement.data('keyframe-blur')
    styles.opacity = sechzig.easing.quadInOut($movement.data('progress'), $movement.data('keyframe-opacity')[0], $movement.data('keyframe-opacity')[1] - $movement.data('keyframe-opacity')[0], $movement.data('duration')) if $movement.data('keyframe-opacity')
    styles.transform = ""
    if $movement.data('keyframe-translate')
      styles.transform += " translate3d(#{sechzig.easing.quadInOut($movement.data('progress'), $movement.data('keyframe-translate').x[0], $movement.data('keyframe-translate').x[1] - $movement.data('keyframe-translate').x[0], $movement.data('duration'))}vw, #{sechzig.easing.quadInOut($movement.data('progress'), $movement.data('keyframe-translate').y[0], $movement.data('keyframe-translate').y[1] - $movement.data('keyframe-translate').y[0], $movement.data('duration'))}vh, 0)"
    if $movement.data('keyframe-rotate')
      styles.transform += " rotate(#{sechzig.easing.quadInOut($movement.data('progress'), $movement.data('keyframe-rotate')[0], $movement.data('keyframe-rotate')[1] - $movement.data('keyframe-rotate')[0], $movement.data('duration'))}deg)"
    if $movement.data('keyframe-scale')
      styles.transform += " scale(#{sechzig.easing.quadInOut($movement.data('progress'), $movement.data('keyframe-scale')[0], $movement.data('keyframe-scale')[1] - $movement.data('keyframe-scale')[0], $movement.data('duration'))})"
    @updateStyles($movement, styles)

  updateStyles: ($movement, styles) ->
    $movement.css styles
