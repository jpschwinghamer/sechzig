sechzig.backing =
  initialize: ->

  setStickyScene: (scene) ->
      @backing = scene.object.find('.backing')
      switch scene.sticky
        when "top"
          if sechzig.scroll.scrollTop < scene.top
            @backing.css({
              'position' : 'static',
              'bottom' : 0,
              'top' : 0
              })
          else
            if sechzig.scroll.scrollBottom <= scene.bottom
              @backing.css({
                'position' : 'fixed',
                'bottom' : 'auto',
                'top' : 0
                })
            else
              @backing.css({
                'position' : 'absolute',
                'bottom' : 0,
                'top' : 'auto'
                })

        when "bottom"
          if sechzig.scroll.scrollBottom < scene.top
            @backing.css({
              'position' : 'static',
              'bottom' : 0,
              'top' : 0
              })
          else
            if sechzig.scroll.scrollBottom <= scene.bottom
              @backing.css({
                'position' : 'fixed',
                'bottom' : 'auto',
                'top' : 0
                })
            else
              @backing.css({
                'position' : 'absolute',
                'bottom' : '0',
                'top' : 'auto'
                })

$ ->
  sechzig.backing.initialize()
