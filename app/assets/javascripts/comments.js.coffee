$ ->
  $("[role='comment']").on('click', (e)->
    e.preventDefault()
    $("[role='comment-container']").toggle()
    )


@Comment =
  submitComment: ()->