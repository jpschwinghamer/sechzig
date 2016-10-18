window.sechzig ?= {}

sechzig.backing =
  init: ->
    @bottomOffset = if /iPad|iPhone|iPod/.test(navigator.userAgent) then '-69px' else '0'

  set: ($cue) ->
    $backing = $cue.find('.backing')
    if $cue.data('clasp') == 'top-hold'
      if $cue.data('top') < sechzig.scroll.scrollBottom
          $backing.css({position: 'absolute', top: 0, bottom: 'auto'})
      if $cue.data('bottom') < sechzig.scroll.scrollBottom
        $backing.css({position: 'absolute', top: 'auto', bottom: @bottomOffset})
      if $cue.data('top') <= sechzig.scroll.scrollTop && $cue.data('bottom') >= sechzig.scroll.scrollBottom
        $backing.css({position: 'fixed', top: 0, bottom: 0})


      # if $cue.data('top') < sechzig.scroll.scrollBottom && $cue.data('bottom') > sechzig.scroll.scrollBottom
      #   $backing.css({position: 'fixed', top: 0})

$ ->
  sechzig.backing.init()
