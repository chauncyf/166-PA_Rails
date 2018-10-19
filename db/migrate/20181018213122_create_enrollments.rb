class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.string :user_id
      t.string :course_id

      t.timestamps
    end
  end
end
