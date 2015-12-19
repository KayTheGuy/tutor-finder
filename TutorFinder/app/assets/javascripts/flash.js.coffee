$ ->
    flashCallback = ->
    $(".flash").fadeOut()
    $(".flash").bind 'click', (ev) =>
    $(".flash").fadeOut()
    setTimeout flashCallback, 3000