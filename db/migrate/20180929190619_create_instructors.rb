class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors, id: false do |t|
      t.string :first
      t.string :middle
      t.string :last
      t.string :email
      t.integer :id

      t.timestamps
    end
  end
end
