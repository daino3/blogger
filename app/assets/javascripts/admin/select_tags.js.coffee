$ ->
  TagSelector.selectTags()

@TagSelector =
  selectTags: (tags) ->
    value = $("#blog_post_selected_tags").val()
    if value?
      tags  = $.parseJSON(value)
      $.each( $("[type='checkbox']"), (index, value)->
        tag = $(value).parent().text()
        tagged = tags.indexOf(tag)
        if tagged >= 0 then $(value).click() else null
      )
