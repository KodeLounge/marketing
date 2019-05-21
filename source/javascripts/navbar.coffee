window.hidingNavbar = ()=>
  didScroll = undefined
  lastScrollTop = 0
  minimumScroll = 5
  $header = $('.kodelounge-navbar')
  navbarHeight = $header.outerHeight()

  hasScrolled = ->
    st = $(this).scrollTop()
    # Do nothing if scrolled less than minimumScroll
    if Math.abs(lastScrollTop - st) <= minimumScroll
      return
    # If scrolled down and have passed the navbar, add class nav-up.
    if st > lastScrollTop and st > navbarHeight
      # Scroll Down
      $header.removeClass('nav-down').addClass 'nav-up'
    else
      # Scroll Up
      if st < $(window).height()/2
        $header.removeClass('nav-up').addClass 'nav-down'
    lastScrollTop = st
    
    return

  $(window).scroll (event) ->
    didScroll = true
    return
  setInterval (->
    if didScroll
      hasScrolled()
      didScroll = false
    return
  ), 250