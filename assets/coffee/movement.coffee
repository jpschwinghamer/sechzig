window.sechzig ?= {}

sechzig.movement =
  play: ($movement, i, direction) ->
    switch $movement.data('keyframe-type')
      when "play-css"
        direction = direction ? if $movement.data('elapsed')[i] == true then 'reverse' else 'normal'
        sechzig.animation.play($movement, i, direction, $movement.data('keyframe-duration'), $movement.data('keyframe-delay'))
        $movement.data('unresolved')[i] = direction

  reset: ($movement, i) ->
    switch $movement.data('keyframe-type')
      when "scrub-css"
        i = 0 if !sechzig.blocking.elapsed($movement, 0)
        direction = if sechzig.blocking.elapsed($movement, i) then 1 else 0
        sechzig.animation.set($movement, i, direction)

  scrub: ($movement, i, progress) ->
    switch $movement.data('keyframe-type')
      when "scrub-css"
        sechzig.animation.scrub($movement, i, progress)

  set: ($movement) ->
    switch $movement.data('keyframe-type')
      when "play-css"
        if !sechzig.blocking.elapsed($movement, 0)
          sechzig.animation.set($movement, 0, 0)
        if sechzig.blocking.elapsed($movement, $movement.data('keyframe-start').length - 1)
          sechzig.animation.set($movement, $movement.data('keyframe-start').length - 1, 1)
