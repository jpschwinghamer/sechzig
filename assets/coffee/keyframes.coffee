sechzig.keyframes = [
  movement =
    scene: 'scene-one'
    character: 'img'
    startTime: 0.5
    finishTime: 0.75
    values: {
      opacity: [1, -0.1]
      transform: {
        translate: [{x: 0, y: 0}, {x: 0, y: -10}]
      }
    }

  movement =
    scene: 'scene-one'
    character: 'h3'
    startTime: 0.5
    finishTime: 0.75
    values: {
      opacity: [1, -0.1]
      transform: {
        translate: [{x: 0, y: 0}, {x: 0, y: -7}]
      }
    }

  movement =
    scene: 'scene-one'
    character: 'p'
    startTime: 0.5
    finishTime: 0.75
    values: {
      opacity: [1, -0.1]
      transform: {
        translate: [{x: 0, y: 0}, {x: 0, y: -4}]
      }
    }

  movement =
    scene: 'scene-one'
    character: '.icon'
    startTime: 0.5
    finishTime: 0.8
    values: {
      opacity: [1, -0.1]
      transform: {
        translate: [{x: 0, y: 0}, {x: 0, y: -1}]
      }
    }

  movement =
    scene: 'scene-two'
    character: '.content'
    startTime: 0
    finishTime: 0.333
    values: {
      opacity: [0, 1]
      transform: {
        translate: [{x: 0, y: 10}, {x: 0, y: 0}]
      }
    }

  movement =
    scene: 'scene-two'
    character: '.content'
    startTime: 0.333
    finishTime: 0.666
    values: {
      transform: {
        translate: [{x: 0, y: 0}, {x: 0, y: -10}]
      }
    }

  movement =
    scene: 'scene-two'
    character: '.step1'
    startTime: 0.333
    finishTime: 0.666
    values: {
      opacity: [1, 0]
    }

  movement =
    scene: 'scene-two'
    character: 'img'
    startTime: 0.333
    finishTime: 0.666
    values: {
      transform: {
        translate: [{x: 0, y: 0}, {x: 0, y: -10}]
      }
    }

  movement =
    scene: 'scene-two'
    character: 'p'
    startTime: 0.333
    finishTime: 0.666
    values: {
      transform: {
        translate: [{x: 0, y: 0}, {x: 0, y: -7}]
      }
    }

  movement =
    scene: 'scene-two'
    character: 'cite'
    startTime: 0.333
    finishTime: 0.666
    values: {
      transform: {
        translate: [{x: 0, y: 0}, {x: 0, y: -5}]
      }
    }

  movement =
    scene: 'scene-two'
    character: 'video'
    type: 'play-video'
    startTime: 0.333
    finishTime: 1
    muted: true

  movement =
    scene: 'scene-two'
    character: 'video'
    startTime: 0.7
    finishTime: 1
    values: {
      opacity: [1, 0]
    }
]
