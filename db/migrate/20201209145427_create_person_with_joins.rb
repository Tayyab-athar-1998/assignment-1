class CreatePersonWithJoins < ActiveRecord::Migration[5.1]
  def change
    create_table :person_with_joins do |t|
      t.string :name
      t.references :parent

      t.timestamps
    end
  end
end
