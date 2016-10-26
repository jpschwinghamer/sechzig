window.sechzig ?= {}

sechzig.backing =
  init: ->
    @bottomOffset = if sechzig.detector.iOS then '-69px' else '0'

  set: ($cue) ->
    $backing = $cue.find('.backing')
    if $cue.data('backing') == 'top'
      if $cue.data('top') < sechzig.scroll.scrollBottom
          $backing.css({position: 'absolute', top: 0, bottom: 'auto'})
      if $cue.data('bottom') < sechzig.scroll.scrollBottom
        $backing.css({position: 'absolute', top: 'auto', bottom: @bottomOffset})
      if $cue.data('top') <= sechzig.scroll.scrollTop && $cue.data('bottom') >= sechzig.scroll.scrollBottom
        $backing.css({position: 'fixed', top: 0, bottom: 0})

    if $cue.data('backing') == 'top-hold'
      if $cue.data('top') <= sechzig.scroll.scrollTop
        $backing.css({position: 'fixed', top: 0, bottom: 0})
      else if $cue.data('top') < sechzig.scroll.scrollBottom
          $backing.css({position: 'absolute', top: 0, bottom: 'auto'})
