module CollectionsHelper
  def link_to_add_hall(form)
    fields = form.fields_for(:halls, Hall.new,
      :child_index => 'new_hall') do |fr|
      render('collections/one_hall_form', fr: fr, i: 'Новый')
    end
    link_to(?#, class: 'btn btn-info',
        id: 'add_hall_link', data: {content: "#{fields}"}) do
      fa_icon("plus") + " Новый Зал"
    end
  end

  def link_to_remove_hall(form)
    form.hidden_field(:_destroy, class: 'remove_fields') +
        link_to(?#, class: 'remove_fields remove_hall') do
      fa_icon('times', title: 'Удалить зал') + ' Удалить'
    end
  end
end
