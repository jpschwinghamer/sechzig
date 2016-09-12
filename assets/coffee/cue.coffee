window.sechzig ?= {}

sechzig.cue =
  init: ->
    @enableBindings()

  enableBindings: ->
    $(document).on 'sechzig-raf', =>
      @monitorCues()

  disableBindings: ->
    $(document).off 'sechzig-raf'

  monitorCues: ->
    $('.cue').each ->
      $cue = $(this)
      if sechzig.cue.active($cue)
        sechzig.blocking.monitorMovements($cue)
        sechzig.backing.set($cue) if $cue.data('clasp')
        $cue.trigger('active') unless $cue.data('active')
        $cue.data('active', true)
      else
        $cue.trigger('inactive') if $cue.data('active')
        $cue.data('active', false)

  active: ($cue) ->
    $cue.data('top') <= sechzig.scroll.scrollBottom && $cue.data('bottom') >= sechzig.scroll.scrollTop
