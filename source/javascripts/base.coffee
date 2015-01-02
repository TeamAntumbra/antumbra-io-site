#!
# * Start Bootstrap - Grayscale Bootstrap Theme (http://startbootstrap.com)
# * Code licensed under the Apache License v2.0.
# * For details, see http://www.apache.org/licenses/LICENSE-2.0.
#

# jQuery to collapse the navbar on scroll
$(window).scroll ->
  if $(".navbar").offset().top > 50
    $(".navbar-fixed-top").addClass "top-nav-collapse"
  else
    $(".navbar-fixed-top").removeClass "top-nav-collapse"
  return


# jQuery for page scrolling feature - requires jQuery Easing plugin
$ ->
  $("a.page-scroll").bind "click", (event) ->
    $anchor = $(this)
    $("html, body").stop().animate
      scrollTop: $($anchor.attr("href")).offset().top
    , 1000, "easeInOutExpo"
    event.preventDefault()
    return

  return


# Closes the Responsive Menu on Menu Item Click
$(".navbar-collapse ul li a").click ->
  $(".navbar-toggle:visible").click()
  return

$(document).ready ->
  $(".faq_question").click ->
    if $(this).parent().is(".open")
      $(this).closest(".faq").find(".faq_answer_container").animate
        height: "0", 500
      $(this).closest(".faq").removeClass "open"
    else
      newHeight = $(this).closest(".faq").find(".faq_answer").height() + "px"
      $(this).closest(".faq").find(".faq_answer_container").animate
        height: newHeight, 500
      $(this).closest(".faq").addClass "open"
    return

  $("#carousel").owlCarousel
    navigation: true # Show next and prev buttons
    navigationText: [
      "<-"
      "->" ]
    slideSpeed: 300
    paginationSpeed: 400
    singleItem: true
    loop: true

  return
