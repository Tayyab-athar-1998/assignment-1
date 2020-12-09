class PersonWithJoin < ApplicationRecord
  has_many :childs, class_name: "PersonWithJoin",
                          foreign_key: "child_id"
 
  belongs_to :parent, class_name: "PersonWithJoin", optional: true
end
