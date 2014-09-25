$ ->
  ScreenUtility.detectWindowSize()



@ScreenUtility =

  detectWindowSize: ()->
    width = window.width()
    console.log(width)