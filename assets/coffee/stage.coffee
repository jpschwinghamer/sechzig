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
        $movement.data('top', $movement.data('keyframe-start') * $cue.data('duration') + $cue.data('top'))
        $movement.data('bottom', $movement.data('keyframe-finish') * $cue.data('duration') + $cue.data('top'))
        $movement.data('duration', $movement.data('bottom') - $movement.data('top'))
        $movement.data('progress', 0)
        $movement.data('elapsed', false)
        $movement.data('inverted', false)
        sechzig.movement.route($movement)

        # Setup movement event listeners
        $movement.on 'active', (e) ->
          e.stopPropagation()
        $movement.on 'inactive', (e) ->
          e.stopPropagation()
          $movement.data('elapsed', sechzig.blocking.elapsed($movement))
          sechzig.movement.reset($movement)

$ ->
  sechzig.stage.init()
