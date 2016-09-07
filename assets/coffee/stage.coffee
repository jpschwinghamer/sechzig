window.sechzig ?= {}

sechzig.stage =
  init: ->
    @arrangeCues()

  arrangeCues: ->
    @cues = []
    $('.cue').each ->
      $el = $(this)
      cueHash =
        id: $el.attr('id')
        top: $el.offset().top
        bottom: $el.offset().top + $el.height()
        height: $el.height()
        object: $el
        duration: $el.height() + sechzig.scroll.scrollHeight
        progress: 0
        blocking: sechzig.blocking.assignMovements(@id)
        clasp: $el.data('clasp') || false
        inverted: false
        ready: false
      sechzig.stage.cues.push(cueHash)

    sechzig.cue.init()
    sechzig.blocking.init()

$ ->
  sechzig.stage.init()
