$ ->
  $("[role='email-form']").on('submit', (e)->
    e.preventDefault()
    form = $(this)
    emailUrl = form.attr('action')
    $.ajax({type: 'post', url: emailUrl, data: form.serialize()}
    ).done((response)->
      $messageContainer = $("[role='email-message-container']")
      $messageContainer.empty()
      if response.errors
        _.each response.errors, (error)->
          compiledTemplate = _.template(JST['templates/failure'])
          $messageContainer.append(compiledTemplate({error: error[0]}))
      else
        compiledTemplate = _.template(JST['templates/success'])
        $messageContainer.append(compiledTemplate({message: response.message}))
        form[0].reset()
        noColor($("[name='email[from]']"))
    )
  )

$(document).on('keyup', "[name='email[from]']", ()->
  $e = $(this)
  if looksLikeEmail($e.val()) then turnGreen($e) else turnRed($e)
)

looksLikeEmail = (input)->
  input.match(/^[\w\d.]+@[\w]+\.[\w]+$/)

turnRed = ($ele)->
  $ele.css('background-color', '#f77d71')

turnGreen = ($ele)->
  $ele.css('background', '#538044')

noColor = ($ele) ->
  $ele.css('background', '#1f2022')
