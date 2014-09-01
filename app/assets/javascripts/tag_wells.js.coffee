$ ->
  $("[role='expandable']").on("click", ->
    $.each($("[role='tag-well']"), (index, value)->
      if $(value).is(':visible')
        $(value).slideToggle("fast")
    )
    $(this).find("[role='tag-well']").slideToggle("fast")
  )