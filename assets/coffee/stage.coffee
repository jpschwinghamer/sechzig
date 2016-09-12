window.sechzig ?= {}

sechzig.stage =
  init: ->
    @setup()
    sechzig.cue.init()

  setup: ->
    $('.cue').each ->
      # Init cues
      $cue = $(this)
      $cue.data('top', $cue.offset().top)
      $cue.data('bottom', $cue.offset().top + $cue.height())
      $cue.data('duration', $cue.height() + sechzig.scroll.scrollHeight)

      # Setup cue event listeners
      $cue.on 'active', (e) ->
        e.stopPropagation()
      $cue.on 'inactive', (e) ->
        e.stopPropagation()

      # Init movements
      $cue.find('[data-character]').each ->
        $movement = $(this)
        $keyframes = $movement.data('keyframe-start')
        dataTop = []
        dataBottom = []
        dataDuration = []
        dataProgress = []
        dataElapsed = []
        # Loop through each keyframe in movement to set up data attrs
        $.each $keyframes, (i) ->
          top = $movement.data("keyframe-start")[i] * $cue.data('duration') + $cue.data('top')
          bottom = $movement.data('keyframe-finish')[i] * $cue.data('duration') + $cue.data('top')
          duration = bottom - top
          progress = 0
          elapsed = false
          dataTop.push(top)
          dataBottom.push(bottom)
          dataDuration.push(duration)
          dataProgress.push(progress)
          dataElapsed.push(elapsed)

        $movement.data('top', dataTop)
        $movement.data('bottom', dataBottom)
        $movement.data('duration', dataDuration)
        $movement.data('progress', dataProgress)
        $movement.data('elapsed', dataElapsed)

        # Setup movement event listeners
        $movement.on 'active', (e) ->
          e.stopPropagation()
        $movement.on 'inactive', (e) ->
          e.stopPropagation()
          # $movement.data('elapsed', sechzig.blocking.elapsed($movement))
          # sechzig.movement.reset($movement)

$ ->
  sechzig.stage.init()
