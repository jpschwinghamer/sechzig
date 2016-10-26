window.sechzig ?= {}

sechzig.cue =
  active: ($cue) ->
    $cue.data('top') < sechzig.scroll.scrollBottom && $cue.data('bottom') > sechzig.scroll.scrollTop

  progress: ($cue) ->
    $cue.find('h3').html( ( (sechzig.scroll.scrollBottom - $cue.data('top'))/$cue.data('duration') ).toFixed(2) )

  monitor: ->
    $('.cue').each ->
      $cue = $(this)
      sechzig.backing.set($cue) if $cue.data('backing')?
      sechzig.cue.progress($cue) if sechzig.cue.active(($cue))
