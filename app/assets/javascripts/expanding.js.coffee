# TODO: rewrite to toggle class of truncated vs. expanded
# TODO: figure out resizing javascript
UIConstants = {
  tagWell: "[role='tag-well']"
  expandingContent: "[role='expandable-content']"
  showMore: "[role='show-more']"
}

window.onresize = ()->
  ContentWindowSetter.setHeightDataAttributes

$ ->
  # on page load, set data attributes of min / max height to access on click events
  ContentWindowSetter.setHeightDataAttributes()

  $(UIConstants.showMore).on("click", ->
    # this evidently has a TON of knowledge about the DOM; can probably do this better
    $contentWindow = $(@).parent().prev().find(UIConstants.expandingContent)

    if !$contentWindow.length
      $contentWindow = $(@).parent().parent().prev().find(UIConstants.expandingContent)

    switch $contentWindow.data("expanded")
      when "false" then ContentWindowSetter.expand($contentWindow, $(@))
      when "true"  then ContentWindowSetter.contract($contentWindow, $(@))
      else null
    )

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
