
$ ->
  $("[role='submit-comment']").on('click', (e)->
    e.preventDefault()
    $form = $(@).parent()
    validated = CommentValidator.validateComment(@)
    if validated then $form.submit()   else return false
    )


@CommentValidator =
  validateComment: (ele)->
    author = CommentValidator.validateAuthor(ele)
    email  = CommentValidator.validateEmail(ele)
    body   = CommentValidator.validateBody(ele)
    return author && email && body

  validateEmail: (ele)->
    $emailBox = $(ele).parent().find("[name='comment[email]']")
    match = $emailBox.val().match(/[A-z\d]+@[A-z\d]+\.[A-z]{2,4}/)
    if match then return true else fadeInAndOut("[role='comment-email']")

  validateAuthor: (ele)->
    $emailBox = $(ele).parent().find("[name='comment[email]']")
    match = $emailBox.val().match(/[A-z\d]/)
    if match then return true else fadeInAndOut("[role='comment-author']")

  validateBody: (ele)->
    $commentBody = $(ele).parent().find("[name='comment[body]']")
    match = $commentBody.val().match(/[A-z\d]/)
    if match then return true else fadeInAndOut("[role='comment-body']")

fadeInAndOut = (ele)->
  $this = $(ele)
  $this.fadeIn("medium", ()->
    setTimeout ( () -> $this.fadeOut("medium") ), 2000
  )