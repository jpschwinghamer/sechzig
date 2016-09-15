window.sechzig ?= {}

sechzig.stage =
  init: ->
    # @setup()
    sechzig.cue.init()
    @colors = []
    for i in [1..$(document).height()]
      rgb = []
      r = Math.round(Math.random() * 255)
      g = Math.round(Math.random() * 255)
      b = Math.round(Math.random() * 255)
      rgb.push(r)
      rgb.push(g)
      rgb.push(b)
      color = "rgb(#{rgb.join()}"
      sechzig.stage.colors.push(color)

#   setup: ->
#     $('.cue').each ->
#       # init cues
#       $cue = $(this)
#       $cue.data('top', $cue.offset().top)
#       $cue.data('bottom', $cue.offset().top + $cue.height())
#       $cue.data('duration', $cue.height() + sechzig.scroll.scrollHeight)

#       # setup cue event listeners
#       $cue.on 'active', (e) ->
#         e.stopPropagation()
#         $cue.data('direction', sechzig.cue.direction($cue))

#       $cue.on 'inactive', (e) ->
#         e.stopPropagation()
#         sechzig.blocking.reset($cue)

#       # init movements
#       $cue.find('[data-character]').each ->
#         $movement = $(this)
#         $keyframes = $movement.data('keyframe-start')
#         dataTop = []
#         dataBottom = []
#         dataDuration = []
#         dataProgress = []
#         dataActive = []
#         dataCompleted = []

#         # loop through each keyframe in movement to set up data attrs
#         $.each $keyframes, (i) ->
#           top = $movement.data("keyframe-start")[i] * $cue.data('duration') + $cue.data('top')
#           bottom = $movement.data('keyframe-finish')[i] * $cue.data('duration') + $cue.data('top')
#           duration = bottom - top
#           progress = 0
#           active = false
#           completed = false
#           # create arrays to insert into data-attrs
#           dataTop.push(top)
#           dataBottom.push(bottom)
#           dataDuration.push(duration)
#           dataProgress.push(progress)
#           dataActive.push(active)
#           dataCompleted.push(completed)

#         # set data-attrs
#         $movement.data('top', dataTop)
#         $movement.data('bottom', dataBottom)
#         $movement.data('duration', dataDuration)
#         $movement.data('progress', dataProgress)
#         $movement.data('active', dataActive)
#         $movement.data('completed', dataCompleted)

#         # setup movement event listeners
#         $movement.on 'active', (e) ->
#           e.stopPropagation()

#         $movement.on 'inactive', (e) ->
#           e.stopPropagation()

#       # initial reset depending on page load position
#       # sechzig.blocking.reset($cue)

$ ->
  sechzig.stage.init()
