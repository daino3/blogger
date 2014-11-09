$ ->
  $("[role='render-email-popup']").on('click', (e)->
    e.preventDefault()
    emailUrl = $(this).attr('data-email-path')
    $.get(emailUrl, (response)->
      console.log(response)
    )
  )