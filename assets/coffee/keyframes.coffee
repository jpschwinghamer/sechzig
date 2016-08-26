window.sechzig ?= {}

sechzig.keyframes ?= []

# TODO: remove all of this – this per-page config
# should be loaded in the client application prior
# to initialization of the framework...
sechzig.keyframes.push
  cue: 'stage'
  character: '.stage-progress-bar'
  type: 'scrub-css-animation'
  startTime: 0.1
  finishTime: 0.9
  values:
    transform:
      translate: [{x: 0, y: 0}, {x: 100, y: 0}]

sechzig.keyframes.push
  cue: 'scene-seven'
  character: '.scene-progress-bar'
  type: 'scrub-css-animation'
  startTime: 0
  finishTime: 1
  values:
    transform:
      translate: [{x: 0, y: 0}, {x: 100, y: 0}]

sechzig.keyframes.push
  cue: 'scene-eight'
  character: '.thing1'
  type: 'scrub-css-animation'
  startTime: 0.2
  finishTime: 1
  values:
    transform:
      translate: [{x: 0, y: 0}, {x: 0, y: 50}]

sechzig.keyframes.push
  cue: 'scene-eight'
  character: '.thing2'
  type: 'scrub-css-animation'
  startTime: 0.3
  finishTime: 1
  values:
    transform:
      translate: [{x: 0, y: 0}, {x: 0, y: 50}]

sechzig.keyframes.push
  cue: 'scene-eight'
  character: '.thing3'
  type: 'scrub-css-animation'
  startTime: 0.4
  finishTime: 1
  values:
    transform:
      translate: [{x: 0, y: 0}, {x: 0, y: 50}]

sechzig.keyframes.push
  cue: 'scene-eight'
  character: '.thing4'
  type: 'scrub-css-animation'
  startTime: 0.5
  finishTime: 1
  values:
    transform:
      translate: [{x: 0, y: 0}, {x: 0, y: 50}]

sechzig.keyframes.push
  cue: 'scene-nine'
  character: '.thing'
  type: 'play-css-animation'
  startTime: 0.2
  finishTime: 1
  transition: 1
  values:
    transform:
      scale: [1,0]
