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
      $(this).css('background-color', sechzig.stage.colors[sechzig.scroll.scrollBottom])
#     $('.cue').each ->
#       $cue = $(this)
#       sechzig.blocking.monitor($cue)
#       if sechzig.cue.active($cue)
#         sechzig.backing.set($cue) if $cue.data('clasp')
#         $cue.trigger('active') unless $cue.data('active')
#         $cue.data('active', true)
#       else
#         $cue.trigger('inactive') if $cue.data('active')
#         $cue.data('active', false)

#   active: ($cue) ->
#     $cue.data('top') < sechzig.scroll.scrollBottom && $cue.data('bottom') > sechzig.scroll.scrollTop

#   direction: ($cue) ->
#     ~~!($cue.data('top') < sechzig.scroll.scrollTop)
