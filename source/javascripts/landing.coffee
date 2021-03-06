#!
# * Start Bootstrap - Grayscale Bootstrap Theme (http://startbootstrap.com)
# * Code licensed under the Apache License v2.0.
# * For details, see http://www.apache.org/licenses/LICENSE-2.0.
# jQuery to collapse the navbar on scroll
$(window).scroll ->
  if $(".navbar").offset().top > 50
    $(".navbar-fixed-top").addClass "top-nav-collapse"
    $(".menu-item").removeClass "dark-text"
    $(".menu-item").addClass "bright-text"
    $("#logotype").attr("src", "//s3.amazonaws.com/antumbra-io/logotype.png")
  else
    $(".navbar-fixed-top").removeClass "top-nav-collapse"
    $(".menu-item").removeClass "bright-text"
    $(".menu-item").addClass "dark-text"
    $("#logotype").attr("src", "//s3.amazonaws.com/antumbra-io/logotype_bw.png")
  return

# jQuery for page scrolling feature - requires jQuery Easing plugin
$ ->
  page = $('html, body')
  $('a.page-scroll').click (e) ->
    page.on 'scroll mousedown wheel DOMMouseScroll mousewheel keyup touchmove', ->
      page.stop()
      return
    page.animate { scrollTop: $($(this).attr("href")).offset().top }, 1000, 'easeInOutExpo', ->
      page.off 'scroll mousedown wheel DOMMouseScroll mousewheel keyup touchmove'
      return
    false

# Closes the Responsive Menu on Menu Item Click
$(".navbar-collapse ul li a").click ->
  $(".navbar-toggle:visible").click()
  return

$(document).ready ->
  $(".fadeOnLoad").removeClass "fadeOnLoad"
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
  return
