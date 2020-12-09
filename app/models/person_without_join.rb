class PersonWithoutJoin < ApplicationRecord
    validates :name, uniqueness: true

    def print_tree
        parent = self.parent
        logger.info(self)
        value = "{Name :'#{self.name}'"
        memo = [self.name]
        while parent!=nil do
            parent_person = PersonWithoutJoin.find_by name:parent
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
end
