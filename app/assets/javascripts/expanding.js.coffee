# TODO: rewrite to toggle class of truncated vs. expanded
# TODO: figure out resizing javascript
# TODO: Consolidate logic
UIConstants = {
  tagWell: "[role='tag-well']"
  expandingContent: "[role='expandable-content']"
  showMore: "[role='show-more']"
  expandable: "[role='expandable']"
}

window.onresize = ()->
  ContentWindowSetter.setHeightDataAttributes

$ ->
  # on page load, set data attributes of min / max height to access on click events
  ContentWindowSetter.setHeightDataAttributes()

  $(UIConstants.showMore).on "click", ->
    $ele = $(@)
    $content = $("[data-#{$ele.data('section')}]")

    switch $content.data("expanded")
      when false then ContentWindowSetter.expand($content, $ele)
      when true  then ContentWindowSetter.contract($content, $ele)
      else null

  $(UIConstants.expandable).on "click", ->
    $selectedCategory       = $(@).find(UIConstants.tagWell)
    selectedCategoryNumber  = $selectedCategory.data("category-number")
    $.each $(UIConstants.tagWell), (index, value)->
      currentCategoryNumber = $(value).data("category-number")
      if $(value).is(':visible') && (currentCategoryNumber != selectedCategoryNumber)
        $(value).slideToggle("fast")
    $selectedCategory.slideToggle("fast")

@ContentWindowSetter =
  setHeightDataAttributes: () ->
    $.each($("[role='expandable-content']"), (index, value)->
      expandedHeight = $(value).find(".markdowned").height()
      minimumHeight  = $(value).height()
      $(value).data("expanded-height", expandedHeight)
      $(value).data("minimum-height", minimumHeight)
      $(value).data("expanded", false)
    )
  expand: ($window, $button) ->
    height = $window.data("expanded-height")
    $window.css('max-height', '')
    $window.animate({height: height + "px"}, "fast")
    $window.data("expanded", true)
    $button.find(".icon-font").removeClass("down-arrow").addClass("up-arrow")
  contract: ($window, $button) ->
    height = $window.data("minimum-height")
    $window.animate({height: height + "px"}, "fast")
    $window.data("expanded", false)
    $button.find(".icon-font").removeClass("up-arrow").addClass("down-arrow")
