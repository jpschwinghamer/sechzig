sechzig.stage =
  initialize: ->
    @arrangeCues()
    sechzig.raf.register(sechzig.stage.printProgress)

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

  printProgress: ->
    $('.thing h1').html(sechzig.stage.cues[0].progress)

$ ->
  sechzig.stage.initialize()
