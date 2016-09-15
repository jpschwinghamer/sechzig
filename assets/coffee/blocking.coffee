window.sechzig ?= {}

sechzig.blocking =
  monitor: ->
    $('[data-character]').each ->
      $movement = $(this)
      $keyframes = $movement.data('keyframe-start')
      $.each $keyframes, (i) ->
        if sechzig.blocking.active($movement, i) then sechzig.blocking.activate($movement, i) else sechzig.blocking.deactivate($movement, i)

  active: ($movement, i) ->
    $movement.data('top')[i] < sechzig.scroll.scrollBottom && $movement.data('bottom')[i] > sechzig.scroll.scrollBottom

  activate: ($movement, i) ->
    sechzig.movement.scrub($movement, i, sechzig.blocking.progress($movement, i)) if $movement.data('keyframe-type').startsWith('scrub')
    $movement.trigger('active', i) unless $movement.data('active')[i]

  deactivate: ($movement, i) ->
    if $movement.data('active')[i] || !$movement.data('active')[i]?
      $movement.trigger('resolve', [i, if sechzig.blocking.elapsed($movement, i) then 'reverse' else 'normal'])
      $movement.trigger('inactive', i)

  elapsed: ($movement, i) ->
    sechzig.scroll.scrollBottom >= $movement.data('bottom')[i]

  progress: ($movement, i) ->
    sechzig.scroll.scrollBottom - $movement.data('top')[i]
