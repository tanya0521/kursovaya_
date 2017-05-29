# Обработка кнопки добавления залов
add_halls = ->
  $("#add-exist-hall").click ->
    val = $("#halls-select").val()
    if($("#hall-" + val).length == 0)
      text = $("#halls-select option:selected").text()
      $("<div class='hall-elem' id='hall-" + val + "'>" + text + "</div>").appendTo($("#list-exist-halls"))
      $("#collection_hall_ids").val($("#collection_hall_ids").val() + ' ' + val)

remove_halls = ->
  $("#remove-exist-hall").click ->
    val = $("#halls-select").val()
    $("#hall-" + val).remove()
    $("#collection_hall_ids").val( $("#collection_hall_ids").val().replace(val, '') )

actions_hall = ->
  add_halls()
  remove_halls()

$(document).ready actions_hall
$(document).on 'page:load', actions_hall
