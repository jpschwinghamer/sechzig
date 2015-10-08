sechzig.keyframes = [
  movement =
    scene : "scene-one"
    character : "canvas"
    type : "draw-canvas"
    loop: true
    imagePath : "/images/test/frame"
    imageType: "jpg"
    imageCount: 60
    startTime : 0.333
    finishTime : 0.666
  movement =
    scene : "scene-one"
    character : "canvas"
    startTime : 0.333
    finishTime : 0.666
    startValues: {
      opacity: 1
      scale: 1
      rotate: 0
    }
    finishValues: {
      opacity: 0
      scale: 0
      rotate: 360
    }
  movement =
    scene : "scene-two"
    character : "canvas"
    type : "scrub-canvas"
    imagePath : "/images/test/frame"
    imageType: "jpg"
    imageCount: 60
    startTime : 0
    finishTime : 0.666
  movement =
    scene : "scene-two"
    character : "canvas"
    startTime : 0
    finishTime : 0.666
    startValues: {
      scale: 1.5
    }
    finishValues: {
      scale: 1
    }
]
