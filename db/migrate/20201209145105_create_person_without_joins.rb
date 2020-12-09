class CreatePersonWithoutJoins < ActiveRecord::Migration[5.1]
  def change
    create_table :person_without_joins do |t|
      t.string :name
      t.string :parent

      t.timestamps
    end
  end
end
