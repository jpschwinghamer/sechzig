sechzig.keyframes = [
  movement =
    scene : "scene-six"
    character : "canvas"
    type : "draw-canvas"
    imagePath : "/images/test/frame"
    imageType: "jpg"
    imageCount: 60
    startTime : 0
    finishTime : 1
  movement =
    scene : "scene-three"
    character : ".character"
    startTime : 0
    finishTime : 0.5
    startValues : {
      rotate : 0
    }
    finishValues : {
      rotate : 180
    }
  movement =
    scene : "scene-two"
    character : ".theng"
    startTime : 0
    finishTime : 0.5
    startValues : {
      scale : 4
    }
    finishValues : {
      scale: 1
    }
  movement =
    scene : "scene-two"
    character : ".thing"
    startTime : 0.25
    finishTime : 0.5
    startValues : {
      opacity : 0
      scale : 0.8
    }
    finishValues : {
      opacity: 1
      scale : 1
    }
]
