sechzig.keyframes = [
  movement =
    cue: "stage"
    character: ".thing"
    type: "scrub-css-animation"
    startTime: 0.5
    finishTime: 0.75
    values: {
      transform: {
        translate: [{x: 0, y: 0}, {x: 100, y: 0}]
      }
    }

  # movement =
  #   cue: "scene-one"
  #   character: "h1"
  #   type: "scrub-css-animation"
  #   startTime: 0.5
  #   finishTime: 1
  #   values: {
  #     opacity: [1,0]
  #     transform: {
  #       translate: [{x: 0, y: 0}, {x: 0, y: -100}]
  #     }
  #   }

  # movement =
  #   scene: "scene-one"
  #   character: "canvas"
  #   type: "scrub-canvas"
  #   imagePath : "/images/reader/"
  #   imageType: "png"
  #   imageCount: 90
  #   loop: false
  #   startTime: -0.3
  #   finishTime: 1.3

  # movement =
  #   scene: "scene-one"
  #   character: "canvas"
  #   type: "scrub-css-animation"
  #   startTime: 0
  #   finishTime: 0.5
  #   values: {
  #     opacity: [0,1]
  #     transform: {
  #       translate: [{x: 0, y: -100}, {x: 0, y: 0}]
  #       rotate: [12,0]
  #     }
  #   }

  # movement =
  #   scene: "scene-one"
  #   character: "canvas"
  #   type: "scrub-css-animation"
  #   startTime: 0.75
  #   finishTime: 1
  #   values: {
  #     opacity: [1,-1    ]
  #     transform: {
  #       translate: [{x: 0, y: 0}, {x: 0, y: 100}]
  #       rotate: [0,12]
  #     }
  #   }

  # movement =
  #   scene: "scene-one"
  #   character: "canvas"
  #   type: "scrub-css-animation"
  #   startTime: 0.7
  #   finishTime: 1
  #   values: {
  #     opacity: [1,0]
  #   }
]
