class Collection < ActiveRecord::Base
  has_many :halls, dependent: :destroy
  has_many :exhibits, dependent: :destroy

  validates :c_name, presence: true
  validates :description, presence: true
  validates :date_begin, presence: true
  validates :date_end, presence: true

  accepts_nested_attributes_for :halls, allow_destroy: true

  def hall_ids=(params)
    params.split.uniq.each do |id|
      self.halls << Hall.find_by(id: id.to_i)
    end
  end
end
