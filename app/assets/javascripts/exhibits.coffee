collection_change_new = ->
  if($("#exhibit_collection_id").length > 0)
    alert("Сначала выберите форму редактирования.\nКнопка (Выбрать существующую/редактировать)")
  else
    elem = $("#collection-change")
    data = elem.attr("data-content-new")
    elem.attr("data-content-new", elem.html())
    elem.html(data)
    window.datepicker_activation_by_item(elem)
  false


collection_change_exist = ->
  elem1 = $("#exhibit_collection_attributes_id")
  elem2 = $("#exhibit_collection_id")
  if(elem1.length == 0 && elem2.length == 0)
    alert("Сначала выберите форму редактирования.\nКнопка (Cоздать/редактировать)")
  else
    elem = $("#collection-change")
    data = elem.attr("data-content-exist")
    elem.attr("data-content-exist", elem.html())
    elem.html(data)
    window.datepicker_activation_by_item(elem)
  false

all_activities = ->
  $("#collection-change-new-btn").click collection_change_new
  $("#collection-change-exist-btn").click collection_change_exist
  # Если страница добавления нового экспоната, то скрыть кнопки и показать скрытую новую связанную форму для коллекции
  # Нужную траницу определяем по её url - "exhibits/new"
  if(location.href.indexOf("exhibits/new") != -1)
    $("#collection-change-new-btn").add("#collection-change-exist-btn").remove()
    collection_change_new()

$(document).ready all_activities
$(document).on 'page:load', all_activities
