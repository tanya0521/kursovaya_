class Exhibit < ActiveRecord::Base
  belongs_to :collection

  validates :e_name, presence: true
  validates :description_e, presence: true
  validates :i_value, presence: true
  validates :age, presence: true
  validates :size, presence: true
  validates :condition, presence: true

  accepts_nested_attributes_for :collection, allow_destroy: true
  
  def self.search(params)
    result = Exhibit.includes(:collection).references(:collection)
    if params['collection'].present?
      result = result.where(collections: {c_name: params['collection']})
    end
    if params['e_name'].present?
      result = result.where(e_name: params['e_name'])
    end
    if params['description_e'].present?
      result = result.where(description_e: params['description_e'])
    end
    if params['i_value'].present?
      result = result.where(i_value: params['i_value'])
    end
    if params['age'].present?
      result = result.where(age: params['age'])
    end
    if params['size'].present?
      result = result.where(size: params['size'])
    end
    if params['condition'].present?
      result = result.where("condition": params['condition'])
    end
     


   result.all
  end
end
