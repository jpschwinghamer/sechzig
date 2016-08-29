window.sechzig ?= {}

sechzig.keyframes ?= []

# TODO: remove all of this – this per-page config
# should be loaded in the client application prior
# to initialization of the framework...
sechzig.keyframes.push
  cue: 'stage'
  character: '.stage-progress-bar'
  type: 'scrub-css-animation'
  start: 0.05
  finish: 0.95
  values:
    transform:
      translate: [{x: 0, y: 0}, {x: 100, y: 0}]

sechzig.keyframes.push
  cue: 'scene-one'
  character: 'h1'
  type: 'scrub-css-animation'
  start: 0.5
  finish: 1
  values:
    transform:
      translate: [{x: 0, y: 0}, {x: 0, y: 30}]

sechzig.keyframes.push
  cue: 'scene-seven'
  character: '.scene-progress-bar'
  type: 'scrub-css-animation'
  start: 0
  finish: 1
  values:
    transform:
      translate: [{x: 0, y: 0}, {x: 100, y: 0}]

sechzig.keyframes.push
  cue: 'scene-eight'
  character: '.thing1'
  type: 'scrub-css-animation'
  start: 0.2
  finish: 1
  values:
    transform:
      translate: [{x: 0, y: 0}, {x: 0, y: 50}]

sechzig.keyframes.push
  cue: 'scene-eight'
  character: '.thing2'
  type: 'scrub-css-animation'
  start: 0.3
  finish: 1
  values:
    transform:
      translate: [{x: 0, y: 0}, {x: 0, y: 50}]

sechzig.keyframes.push
  cue: 'scene-eight'
  character: '.thing3'
  type: 'scrub-css-animation'
  start: 0.4
  finish: 1
  values:
    transform:
      translate: [{x: 0, y: 0}, {x: 0, y: 50}]

sechzig.keyframes.push
  cue: 'scene-eight'
  character: '.thing4'
  type: 'scrub-css-animation'
  start: 0.5
  finish: 1
  values:
    transform:
      translate: [{x: 0, y: 0}, {x: 0, y: 50}]

sechzig.keyframes.push
  cue: 'scene-nine'
  character: '.thing'
  type: 'play-css-animation'
  start: 0.1
  finish: 0.9
  transition: 1
  values:
    opacity: [1,0]
    blur: [0,0]
    transform:
      rotate: [0,360]
      scale: [1,0.5]
