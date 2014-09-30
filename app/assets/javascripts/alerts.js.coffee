$ ->
  removeAlerts()

removeAlerts = ()->
  $alerts = $("[role='alerts-container']")
  if $alerts.is(":visible")
    setTimeout ( ()-> $alerts.fadeOut("medium") ), 3000