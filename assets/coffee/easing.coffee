window.sechzig ?= {}

# TODO: replace this with an open source easing library?
sechzig.easing =
  linear: (progress,startValue,valueChange,duration) ->
    valueChange*progress/duration + startValue

  quadInOut: (progress, startValue, valueChange, duration) ->
    if (progress = progress/(duration/2)) < 1
      valueChange/2 * progress*progress + startValue
    else
      -valueChange/2 * ((progress -= 1)*(progress-2)-1) + startValue

  expoInOut: (progress,startValue,valueChange,duration) ->
    if progress == 0
      startValue
    else if progress == duration
      startValue+valueChange
    else if (progress = progress/(duration/2)) < 1
      valueChange/2 * Math.pow(2,10*(progress-1)) + startValue
    else
      valueChange/2*(-Math.pow(2,-10*(progress-1))+2)+startValue;
