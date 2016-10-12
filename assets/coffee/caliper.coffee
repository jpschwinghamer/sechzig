window.sechzig ?= {}

sechzig.caliper =
  pattern: /^([+-]?(?:\d+|\d*\.\d+))([a-z]*|%)$/

  value: (value) ->
    value.match(@pattern)[1]

  unit: (value) ->
    value.match(@pattern)[2]
