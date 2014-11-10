$ ->
  $("[role='render-email-popup']").on('click', (e)->
    e.preventDefault()
    emailUrl = $(this).attr('data-email-path')
    $.get(emailUrl, (response)->
      $("body").append(response)
      $("[role='email-container']").center()
    )
  )

$(document).on('keyup', "[name='email[from]']", ()->
  $e = $(this)
  if looksLikeEmail($e.val()) then turnGreen($e) else turnRed($e)
)

$(document).on('click', "[role='send-email']", (e)->
  e.preventDefault()
  $e = $(this)
  $emailField = $("[name='email[from]']")
  if looksLikeEmail($emailField.val())
    $e.trigger('submit');
  else
    turnRed($emailField)
)

$(document).on('click', "[role='close-email']", (e)->
  e.preventDefault()
  $("[role='email-container']").remove()
)

looksLikeEmail = (input)->
  input.match(/^[\w\d.]+@[\w]+\.[\w]+$/)

turnRed = ($ele)->
  $ele.css('background-color', 'rgba(244, 44, 44, 0.9)')
  $ele.css('color', 'white')

turnGreen = ($ele)->
  $ele.css('background', '#538044')
  $ele.css('color', 'white')
