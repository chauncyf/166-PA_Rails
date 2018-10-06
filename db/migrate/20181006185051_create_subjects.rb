class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects, id: false do |t|
      t.string :name
      t.string :abbreviation
      t.string :id

      t.timestamps
    end
  end
end
