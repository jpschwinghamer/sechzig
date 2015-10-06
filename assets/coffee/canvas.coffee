sechzig.canvas =
  initialize: (movement) ->
    movement.canvas = movement.object[0]
    movement.context = movement.canvas.getContext('2d')
    movement.images = []
    @buildImages(movement)
    @getImageSizes(movement)

  buildImages: (movement) ->
    for i in [1..movement.imageCount]
      img = new Image
      img.src = "#{movement.imagePath + i}.#{movement.imageType}"
      movement.images.push(img)
    movement.images

  getImageSizes: (movement) ->
    img = new Image
    $(img).on 'load', ->
      movement.imageWidth = this.width
      movement.imageHeight = this.height
      sechzig.canvas.setCanvasSize(movement)
    img.src = "#{movement.imagePath + 1}.#{movement.imageType}"

  setCanvasSize: (movement) ->
    movement.object.attr
      width : movement.imageWidth
      height : movement.imageHeight
    movement.object.css
      width : movement.imageWidth/2
      height : movement.imageHeight/2

  scrubCanvas: (movement) ->
    frame = Math.min(
      Math.floor(sechzig.easing.quadInOut(movement.pixelProgress, 0, movement.imageCount, movement.pixelDistance)),
      movement.imageCount)
    movement.context.drawImage(movement.images[frame],0,0)
