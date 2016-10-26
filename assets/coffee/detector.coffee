window.sechzig ?= {}

sechzig.detector =
  init: ->
    @iOS = /iPad|iPhone|iPod/.test(navigator.userAgent)

