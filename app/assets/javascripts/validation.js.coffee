
$ ->
  $("[role='submit-comment']").on('click', (e)->
    # e.preventDefault()
    # CommentValidator.validateComment(@)
    )


@CommentValidator =
  validateComment: (ele)->
    CommentValidator.validateEmail(ele)
    CommentValidator.validateBody(ele)

  validateEmail: (ele)->
    $emailBox = $(ele).parent().find("[name='comment[email]']")
    debugger
    $emailBox.val().match(/[A-z\d]+@[A-z\d]+\.[A-z]{2,4}/)

  validateBody: (ele)->
    $commentBody = $(ele).parent().find("[name='comment[body]']")
    debugger
    $commentBody.val().match(/[A-z\d]/)