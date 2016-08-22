sechzig.stage =
  initialize: ->
    @arrangeCues()

  arrangeCues: ->
    @cues = []
    $('.cue').each ->
      $this = $(this)
      cueHash =
        id: $this.attr('id')
        top: $this.offset().top
        bottom: $this.offset().top + $this.height()
        height: $this.height()
        object: $this
        duration: $this.height() + sechzig.scroll.scrollHeight
        cueIsActive: false
        progress: 0
        blocking: sechzig.blocking.assignMovements(@id)
        clasp: $this.data('clasp') || false
      sechzig.stage.cues.push(cueHash)

$ ->
  sechzig.stage.initialize()
