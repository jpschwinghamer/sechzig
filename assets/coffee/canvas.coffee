sechzig.canvas =
  initialize: (movement) ->
    movement.canvas = movement.object[0]
    movement.context = movement.canvas.getContext('2d')
    movement.images = []
    movement.playCount = 1
    @buildImages(movement)

  buildImages: (movement) ->
    for i in [1..movement.imageCount]
      img = new Image
      img.src = "#{movement.imagePath + i}.#{movement.imageType}"
      movement.images.push(img)
    sechzig.canvas.getImageSize(movement)

  getImageSize: (movement) ->
    $(movement.images[movement.imageCount - 1]).on "load", ->
      movement.imageWidth = this.width
      movement.imageHeight = this.height
      sechzig.canvas.setCanvasSize(movement)

  setCanvasSize: (movement) ->
    movement.object.attr
      width : movement.imageWidth
      height : movement.imageHeight
    movement.object.css
      width : movement.imageWidth/2
      height : movement.imageHeight/2
    sechzig.canvas.preDraw(movement)

  preDraw: (movement) ->
    for image in movement.images
      movement.context.drawImage(image,0,0)
    movement.context.drawImage(movement.images[0],0,0)
    movement.canvasReady = true

  scrubCanvas: (movement) ->
    frame =
      Math.max( Math.min( Math.floor(sechzig.easing.expoInOut(movement.pixelProgress, 0, movement.imageCount, movement.pixelDistance)),movement.imageCount), 0)
    movement.context.drawImage(movement.images[frame],0,0, movement.imageWidth, movement.imageHeight)

  drawCanvas: (movement) ->
    if movement.playCount < movement.imageCount
      movement.context.drawImage(movement.images[movement.playCount++],0,0, movement.imageWidth, movement.imageHeight)
    else
      movement.playCount = 1
      if movement.loop == false
        movement.canvasReady = false
