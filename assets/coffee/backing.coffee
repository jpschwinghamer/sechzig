window.sechzig ?= {}

sechzig.backing =
  setCueClasp: (cue) ->

      switch cue.clasp
        when "top"
          if sechzig.scroll.scrollTop < cue.top
            styles =
              position : 'relative'
              bottom : 0
              top : 0
          else if sechzig.scroll.scrollBottom <= cue.bottom
            styles =
              position : 'fixed'
              bottom : 'auto'
              top : 0
          else
            styles =
              position : 'absolute'
              bottom : 0
              top : 'auto'

        when "top-hold"
          if sechzig.scroll.scrollTop > cue.bottom
            styles =
              position : 'relative'
              bottom : 0
              top : 'auto'
              visibility: 'hidden'
          # else
          else if sechzig.scroll.scrollTop <= cue.top
            styles =
              position : 'absolute'
              bottom : 'auto'
              top : 0
              visibility: 'visible'
          else
            styles =
              position : 'fixed'
              bottom : 'auto'
              top : 0
              visibility: 'visible'

        when "bottom"
          if sechzig.scroll.scrollBottom < cue.top
            styles =
              position : 'relative'
              bottom : 0
              top : 0
          else if sechzig.scroll.scrollBottom <= cue.bottom
            styles =
              position : 'fixed'
              bottom : 'auto'
              top : 0
          else
            styles =
              position : 'absolute'
              bottom : 0
              top : 'auto'

        when "bottom-hold"
          if sechzig.scroll.scrollBottom < cue.top
            styles =
              position : 'relative'
              bottom : 0
              top : 0
              visibility: 'hidden'
          else if sechzig.scroll.scrollTop >= cue.bottom
            styles =
              position : 'absolute'
              bottom : 0
              top : 'auto'
              visibility: 'hidden'
          else
            styles =
              position : 'fixed'
              bottom : 'auto'
              top : 0
              visibility: 'visible'

      # apply styles
      cue.object.find('.backing').css styles
