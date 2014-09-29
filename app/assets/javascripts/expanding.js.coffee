# TODO: rewrite to toggle class of truncated vs. expanded
# TODO: figure out resizing javascript
window.onresize = ()->
  ContentWindowSetter.setHeightDataAttributes
$ ->
  # on page load, set data attributes of min / max height to access on click events
  ContentWindowSetter.setHeightDataAttributes()

  $("[role='expandable']").on("click", ->
    $selectedCategory       = $(this).find("[role='tag-well']")
    selectedCategoryNumber  = $selectedCategory.attr("data-category-number")
    $.each($("[role='tag-well']"), (index, value)->
      currentCategoryNumber = $(value).attr("data-category-number")
      if $(value).is(':visible') && (currentCategoryNumber != selectedCategoryNumber)
        $(value).slideToggle("fast")
    )
    $selectedCategory.slideToggle("fast")
  )

  $("[role='show-more']").on("click", ->
    # this evidently has a TON of knowledge about the DOM; can probably do this better
    $contentWindow =  $(this).parent().prev().find("[role='expandable-content']")

    if !$contentWindow.length
      $contentWindow =  $(this).parent().parent().prev().find("[role='expandable-content']")

    switch $contentWindow.attr("data-expanded")
      when "false" then ContentWindowSetter.expand($contentWindow, $(this))
      when "true"  then ContentWindowSetter.contract($contentWindow, $(this))
      else null
    )

@ContentWindowSetter =
  setHeightDataAttributes: () ->
    $.each($("[role='expandable-content']"), (index, value)->
      expandedHeight = $(value).find(".markdowned").height()
      minimumHeight  = $(value).height()
      $(value).attr("data-expanded-height", expandedHeight)
      $(value).attr("data-minimum-height", minimumHeight)
      $(value).attr("data-expanded", false)
    )
  expand: ($window, $button) ->
    height = $window.attr("data-expanded-height")
    $window.css('max-height', '')
    $window.animate({height: height + "px"}, "fast")
    $window.attr("data-expanded", true)
    $button.find(".icon-font").removeClass("down-arrow").addClass("up-arrow")
  contract: ($window, $button) ->
    height = $window.attr("data-minimum-height")
    $window.animate({height: height + "px"}, "fast")
    $window.attr("data-expanded", false)
    $button.find(".icon-font").removeClass("up-arrow").addClass("down-arrow")
