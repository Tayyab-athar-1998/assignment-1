class PersonWithJoin < ApplicationRecord
  validates :name, uniqueness: true

  has_many :child, class_name: "PersonWithJoin",
                          foreign_key: "parent_id"
 
  belongs_to :parent, class_name: "PersonWithJoin", optional: true

  def print_tree
    parent = self.parent
    value = "{Name :'#{self.name}'"
    memo = [self.name]
    while parent!=nil do
      if memo.include? parent
          return 'Cycle detected'
      end
      parent_person_name = parent.name
      value.concat(",Parent :{Name :'#{parent_person_name}'}")
      parent = parent.parent
      memo.append(parent)
    end
    value.concat("}")
    return value
  end
end
