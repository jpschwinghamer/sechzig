sechzig.backing =
  initialize: ->

  setStickyScene: (scene) ->
      @backing = scene.object.find('.backing')
      switch scene.sticky
        when "top"
          if scene.top <= sechzig.scroll.scrollTop and scene.bottom >= sechzig.scroll.scrollBottom
            @backing.css({
              'position': 'fixed',
              'top' : 0,
              'bottom': 'auto',
            })
          if scene.top >= sechzig.scroll.scrollTop
            @backing.css({
              'position': 'static'
            })
          if scene.bottom <= sechzig.scroll.scrollBottom
            @backing.css({
            'position': 'absolute',
            'bottom': 0,
            'top': 'auto'
            })

        when "bottom"
          if scene.top <= sechzig.scroll.scrollBottom
            scene.object.find('.backing').css({
              'position' : 'fixed',
              'bottom' : 0
            })
          else
            scene.object.find('.backing').css({'position' : 'static'})

$ ->
  sechzig.backing.initialize()
