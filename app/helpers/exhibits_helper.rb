module ExhibitsHelper
  def new_collection_form(form)
    form.fields_for(:collection, Collection.new) do |fr|
      render('exhibits/one_collection_form', fr: fr)
    end
  end
end
