window.sechzig ?= {}

sechzig.cue =
  active: ($cue) ->
    $cue.data('top') < sechzig.scroll.scrollBottom && $cue.data('bottom') > sechzig.scroll.scrollTop

  monitor: ->
    $('.cue').each ->
      $cue = $(this)
      sechzig.backing.set($cue) if sechzig.cue.active($cue) && $cue.data('clasp')?
