class PersonWithoutJoin < ApplicationRecord
    validate :if_parent_exists 
    validates :name, uniqueness: true

    def print_tree
        parent = self.parent
        logger.info(self)
        value = "{Name :'#{self.name}'"
        memo = [self.name]
        while parent!=nil do
            parent_person = PersonWithoutJoin.find_by name:parent
            if parent_person==nil
                raise "Flaky data in db. Parent to child #{self.name} doesnot exists."
            end
            parent = parent_person.parent
            if memo.include? parent
                return 'Cycle detected'
            end
            parent_person_name = parent_person.name
            memo.append(parent_person_name)
            value.concat(",Parent :{Name :'#{parent_person_name}'}")
        end
        value.concat("}")
        return value
    end

    private
    def if_parent_exists
        if parent != nil && PersonWithoutJoin.find_by_name parent == nil
            errors.add(:parent, "Parent with value #{parent} doesnot exists.")
        end
    end
end
