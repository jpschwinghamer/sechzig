sechzig.stage =
  initialize: ->
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
        cueIsActive: false
        progress: 0
        blocking: sechzig.blocking.assignMovements(@id)
        clasp: $el.data('clasp') || false
      sechzig.stage.cues.push(cueHash)

$ ->
  sechzig.stage.initialize()
