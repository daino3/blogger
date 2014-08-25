$(document).on("keyup", "[name='page[body]']", ()->
  $e   = $(this)
  text = $e.val()
  url  = $e.attr("data-url")

  debugger

  $.ajax({
    url: url,
    data: { "text": text }
    success: (response) ->
      $("[role='markdown-container']").html(response)
    })
  )