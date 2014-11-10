jQuery.fn.center = ()->
  this.css("position","absolute");
  topOfWindow  = $(window).scrollTop()
  leftOfWindow = ($(window).width()  - $(this).outerWidth()) / 2
  this.css("top", Math.max(0, topOfWindow) + "px")
  this.css("left", Math.max(0, leftOfWindow) + "px")
  return this;