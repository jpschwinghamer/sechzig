window.sechzig ?= {}

sechzig.stage =
  init: ->
    sechzig.scroll.init()
    @setup()
    sechzig.raf.start()

  setup: ->
    $('.stage').addClass('touch') if /iPad|iPhone|iPod/.test(navigator.userAgent)

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

      $movement.on 'active',  (e, i) ->
        e.stopPropagation()
        $movement.data('active')[i] = true

      $movement.on 'inactive', (e, i) ->
        e.stopPropagation()
        $movement.data('active')[i] = false
        $movement.data('elapsed')[i] = sechzig.blocking.elapsed($movement, i)
        sechzig.movement.reset($movement, i)


$ ->
  sechzig.stage.init()
