# window.sechzig ?= {}

# sechzig.blocking =
#   monitor: ($cue) ->
#     $cue.find('[data-character]').each ->
#       $movement = $(this)
#       $keyframes = $movement.data('keyframe-start')
#       progress = $movement.data('progress')
#       active = $movement.data('active')
#       completed = $movement.data('completed')
#       $.each $keyframes, (index) ->
#         active[index] = sechzig.blocking.active($movement, index)
#         completed[index] = sechzig.blocking.completed($movement, index)
#         if sechzig.blocking.active($movement, index)
#           progress[index] = sechzig.blocking.progress($movement, index)
#           $movement.data('progress', progress)
#           sechzig.movement.route($movement, $cue, index)

#   active: ($movement, index) ->
#     $movement.data('top')[index] < sechzig.scroll.scrollBottom && $movement.data('bottom')[index] > sechzig.scroll.scrollBottom

#   completed: ($movement, index) ->
#     $movement.data('top')[index] < sechzig.scroll.scrollBottom

#   progress: ($movement, index) ->
#     sechzig.scroll.scrollBottom - $movement.data('top')[index]

#   reset: ($cue) ->
#     $cue.find('[data-character]').each ->
#       $movement = $(this)
#       $keyframes = $movement.data('keyframe-start')
#       $.each $keyframes, (index) ->
#         index = $movement.data('completed')[index]
#         start = if index then $keyframes.length - 1 else 0
#         sechzig.movement.reset($movement, $cue, start, $cue.data('direction'))
