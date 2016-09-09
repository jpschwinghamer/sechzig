window.sechzig ?= {}

sechzig.blocking =
  monitorMovements: ($cue) ->
    $cue.find('[data-character]').each ->
      $movement = $(this)
      if sechzig.blocking.active($movement)
        $movement.trigger('active') unless $movement.data('active')
        $movement.data('active', true)
        $movement.data('progress', sechzig.blocking.progress($movement))
        sechzig.movement.route($movement)
      else
        $movement.trigger('inactive') if $movement.data('active')
        $movement.data('active', false)

  active: ($movement) ->
    $movement.data('top') < sechzig.scroll.scrollBottom && $movement.data('bottom') > sechzig.scroll.scrollBottom

  elapsed: ($movement) ->
    $movement.data('bottom') < sechzig.scroll.scrollBottom

  progress: ($movement) ->
    sechzig.scroll.scrollBottom - $movement.data('top')
