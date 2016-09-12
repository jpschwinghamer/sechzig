window.sechzig ?= {}

sechzig.blocking =
  monitorMovements: ($cue) ->
    $cue.find('[data-character]').each ->
      $movement = $(this)
      $keyframes = $movement.data('keyframe-start')
      progress = $movement.data('progress')
      $.each $keyframes, (i) ->
        if sechzig.blocking.active($movement, i)
          $movement.trigger('active') unless $movement.data('active')
          progress[i] = sechzig.blocking.progress($movement, i)
          $movement.data('progress', progress)
          $movement.data('active', true)
          sechzig.movement.route($movement, i)
        else
          $movement.trigger('inactive') if $movement.data('active')
          $movement.data('active', false)

  active: ($movement, i) ->
    $movement.data('top')[i] < sechzig.scroll.scrollBottom && $movement.data('bottom')[i] > sechzig.scroll.scrollBottom

  elapsed: ($movement) ->
    $movement.data('bottom') < sechzig.scroll.scrollBottom

  progress: ($movement, i) ->
    sechzig.scroll.scrollBottom - $movement.data('top')[i]
