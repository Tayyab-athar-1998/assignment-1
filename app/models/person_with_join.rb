class PersonWithJoin < ApplicationRecord
  has_many :parent, class_name: "PersonWithJoin",
                          foreign_key: "parent_id"
 
  belongs_to :child, class_name: "PersonWithJoin", optional: true
end
