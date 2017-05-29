class Hall < ActiveRecord::Base
   belongs_to :collection 

  validates :name, presence: true
end
