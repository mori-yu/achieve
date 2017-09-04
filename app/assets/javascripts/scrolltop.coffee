ready = ->
  $(window).scroll ->
    element = $('#page-top-btn')
    visible = element.is(':visible')
    height = $(window).scrollTop()
    if location.pathname == "/blogs"
        scroll_px = 200
    else 
        scroll_px = 400
    if height > scroll_px
      element.fadeIn() if !visible
    else
      element.fadeOut()
  $(document).on 'click', '#move-page-top', ->
    $('html, body').animate({ scrollTop: 0 }, 'slow')

$(document).ready(ready)
$(document).on('page:load', ready)