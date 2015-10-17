sechzig.keyframes = [
  movement =
    scene: 'scene-one'
    character: '.marker'
    type: 'play-css-animation'
    startTime: 0.5
    finishTime: 0.75
    duration: 1
    values: {
      opacity: [0,1]
    }

  movement =
    scene: 'scene-two'
    character: 'h3'
    type: 'play-css-animation'
    startTime: 0.25
    finishTime: 0.75
    duration: 1
    values: {
      opacity: [0,1]
    }

  movement =
    scene: 'scene-two'
    character: '.item:nth-child(1) h6'
    type: 'play-css-animation'
    delay: 0.125
    startTime: 0.25
    finishTime: 0.75
    duration: 0.75
    values: {
      opacity: [0,1]
    }

  movement =
    scene: 'scene-two'
    character: '.item:nth-child(1) .bar'
    type: 'play-css-animation'
    delay: 0.125
    startTime: 0.25
    finishTime: 0.75
    duration: 0.75
    values: {
      opacity: [0,1]
      transform: {
        translate: [{x: -100, y: 0}, {x: 0, y: 0}]
      }
    }

  movement =
    scene: 'scene-two'
    character: '.item:nth-child(2) h6'
    type: 'play-css-animation'
    delay: 0.25
    startTime: 0.25
    finishTime: 0.75
    duration: 0.75
    values: {
      opacity: [0,1]
    }

  movement =
    scene: 'scene-two'
    character: '.item:nth-child(2) .bar'
    type: 'play-css-animation'
    delay: 0.25
    startTime: 0.25
    finishTime: 0.75
    duration: 0.75
    values: {
      opacity: [0,1]
      transform: {
        translate: [{x: -100, y: 0}, {x: -20, y: 0}]
      }
    }

  movement =
    scene: 'scene-two'
    character: '.item:nth-child(3) h6'
    type: 'play-css-animation'
    delay: 0.375
    startTime: 0.25
    finishTime: 0.75
    duration: 0.75
    values: {
      opacity: [0,1]
    }

  movement =
    scene: 'scene-two'
    character: '.item:nth-child(3) .bar'
    type: 'play-css-animation'
    delay: 0.375
    startTime: 0.25
    finishTime: 0.75
    duration: 0.75
    values: {
      opacity: [0,1]
      transform: {
        translate: [{x: -100, y: 0}, {x: -40, y: 0}]
      }
    }

  movement =
    scene: 'scene-two'
    character: '.item:nth-child(4) h6'
    type: 'play-css-animation'
    delay: 0.5
    startTime: 0.25
    finishTime: 0.75
    duration: 0.75
    values: {
      opacity: [0,1]
    }

  movement =
    scene: 'scene-two'
    character: '.item:nth-child(4) .bar'
    type: 'play-css-animation'
    delay: 0.5
    startTime: 0.25
    finishTime: 0.75
    duration: 0.75
    values: {
      opacity: [0,1]
      transform: {
        translate: [{x: -100, y: 0}, {x: -17, y: 0}]
      }
    }

  movement =
    scene: 'scene-two'
    character: '.item:nth-child(5) h6'
    type: 'play-css-animation'
    delay: 0.675
    startTime: 0.25
    finishTime: 1
    duration: 0.75
    values: {
      opacity: [0,1]
    }

  movement =
    scene: 'scene-two'
    character: '.item:nth-child(5) .bar'
    type: 'play-css-animation'
    delay: 0.675
    startTime: 0.25
    finishTime: 0.75
    duration: 0.75
    values: {
      opacity: [0,1]
      transform: {
        translate: [{x: -100, y: 0}, {x: -30, y: 0}]
      }
    }

  movement =
    scene: 'scene-three'
    character: '.marker'
    type: 'scrub-css-animation'
    startTime: 0.25
    finishTime: 0.5
    values: {
      opacity: [0,1]
    }

  movement =
    scene: 'scene-four'
    character: '.step1'
    startTime: 0.0
    finishTime: 0.2
    values: {
      opacity: [-1,1]
    }

  movement =
    scene: 'scene-four'
    character: '.horz-gallery'
    startTime: 0.20
    finishTime: 0.80
    values: {
      transform: {
        translate: [{x: 200, y: 0}, {x: -200, y: 0}]
      }
    }
]
