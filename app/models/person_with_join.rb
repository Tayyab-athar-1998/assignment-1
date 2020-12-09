class PersonWithJoin < ApplicationRecord
  validates :name, uniqueness: true

  has_many :child, class_name: "PersonWithJoin",
                          foreign_key: "parent_id"
 
  belongs_to :parent, class_name: "PersonWithJoin", optional: true
end
