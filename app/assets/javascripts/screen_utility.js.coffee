$ ->
  ScreenUtility.detectWindowSize()

@ScreenUtility =
  detectWindowSize: ()->
    width = $(window).width()