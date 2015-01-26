$(document).on("keyup", "[name='page[body]']", ()->
  renderMarkdown(@)
)

$(document).on("keyup", "[name='blog_post[body]']", ()->
  renderMarkdown(@)
)

renderMarkdown = (ele)->
  markdownedContent = marked( $(ele).val() )
  $("[role='markdown-container']").html(markdownedContent)