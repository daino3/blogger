$(document).on("keyup", "[name='page[body]']", ()->
  renderMarkdown(@)
)

$(document).on("keyup", "[name='blog_post[body]']", ()->
  renderMarkdown(@)
)

renderMarkdown = (ele)->
  $e   = $(ele)
  text = $e.val()
  url  = $e.attr("data-url")

  $.ajax({
    url: url,
    data: { "text": text }
    success: (response) ->
      $("[role='markdown-container']").html(response)
    })