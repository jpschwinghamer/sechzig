# window.sechzig ?= {}

# $(window).on 'load', ->
#   $(document).trigger('stage-ready')

# # Non framework response animation
# $(document).on 'stage-ready', ->
#   animate = ->
#     test = $('.curtain1')[0].animate( [{transform: 'translate3d(0,0,0)'}, {transform: 'translate3d(105vw, 0, 0)'}], easing: 'cubic-bezier(0.645, 0.045, 0.355, 1)', duration: 600, fill: 'forwards')
#     $('.curtain2')[0].animate( [{transform: 'translate3d(0,0,0)'}, {transform: 'translate3d(105vw, 0, 0)'}], easing: 'cubic-bezier(0.645, 0.045, 0.355, 1)', duration: 600, delay: 50, fill: 'forwards')
#     $('.curtain3')[0].animate( [{transform: 'translate3d(0,0,0)'}, {transform: 'translate3d(105vw, 0, 0)'}], easing: 'cubic-bezier(0.645, 0.045, 0.355, 1)', duration: 600, delay: 150, fill: 'forwards')
#     $('.curtain4')[0].animate( [{transform: 'translate3d(0,0,0)'}, {transform: 'translate3d(105vw, 0, 0)'}], easing: 'cubic-bezier(0.645, 0.045, 0.355, 1)', duration: 800, delay: 200, fill: 'forwards')
#     test.onfinish = ->
#       $(document).trigger('curtain-lifted')
#   setTimeout animate, 1000

# $(document).on 'curtain-lifted', ->
#   alert 'sdfs'
