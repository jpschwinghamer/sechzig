sechzig.stage =
  initialize: ->
    @arrangeScenes()

  arrangeScenes: ->
    @scenes = []
    $('.scene').each ->
      $this = $(this)
      scenesHash =
        id: $this.attr('id')
        top: $this.offset().top
        bottom: $this.offset().top + $this.height()
        height: $this.height()
        object: $this
        duration: $this.height() + sechzig.scroll.scrollHeight
        sceneIsActive: false
        progress: 0
        blocking: sechzig.blocking.assignMovements(@id)
        sticky: $this.data('sticky') || false
      sechzig.stage.scenes.push(scenesHash)

$ ->
  sechzig.stage.initialize()
