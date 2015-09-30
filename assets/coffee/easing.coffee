sechzig.easing =
  initialize: ->

  quadInOut: (progress, startValue, valueChange, duration) ->
    if (progress = progress/(duration/2)) < 1
      return valueChange/2 * progress*progress + startValue
    else
      return -valueChange/2 * ((progress -= 1)*(progress-2)-1) + startValue

$ ->
  sechzig.easing.initialize()
