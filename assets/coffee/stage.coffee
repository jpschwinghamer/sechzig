window.sechzig ?= {}

sechzig.stage =
  init: ->
    @setup()
    sechzig.raf.start()

  setup: ->
    $('[data-character]').each ->
      $movement = $(this)
      $cue = $movement.closest('.cue')

      $cue.data('top', $cue.offset().top)
      $cue.data('bottom', $cue.offset().top + $cue.height())
      $cue.data('duration', $cue.height() + sechzig.scroll.scrollHeight)

      $movement.data('top', [])
      $movement.data('bottom', [])
      $movement.data('duration', [])
      $movement.data('active', [])
      $movement.data('elapsed', [])
      $movement.data('unresolved', [])

      $keyframes = $movement.data('keyframe-start')
      $.each $keyframes, (i) ->
        $movement.data('top').push($movement.data("keyframe-start")[i] * $cue.data('duration') + $cue.data('top') )
        $movement.data('bottom').push($movement.data('keyframe-finish')[i] * $cue.data('duration') + $cue.data('top') )
        $movement.data('duration').push($movement.data('bottom')[i] - $movement.data('top')[i] )
        $movement.data('elapsed').push(sechzig.blocking.elapsed($movement, i) )
        $movement.data('unresolved').push(false)

      sechzig.movement.set($movement)

      $movement.on 'active',  (e, i) ->
        e.stopPropagation()
        $movement.data('active')[i] = true
        if $movement.data('keyframe-type').startsWith('play')
          sechzig.movement.play($movement, i)

      $movement.on 'inactive', (e, i) ->
        e.stopPropagation()
        $movement.data('active')[i] = false
        $movement.data('elapsed')[i] = sechzig.blocking.elapsed($movement, i)
        sechzig.movement.reset($movement, i)

      $movement.on 'resolve', (e, i, direction) ->
        e.stopPropagation()
        if $movement.data('unresolved')[i] == direction
          if direction == "normal" then sechzig.movement.play($movement, i, 'reverse') else sechzig.movement.play($movement, i, 'normal')

$ ->
  sechzig.stage.init()
