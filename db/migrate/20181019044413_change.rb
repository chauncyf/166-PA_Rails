class Change < ActiveRecord::Migration[5.2]
  def change
    change_column :enrollments, :user_id, :integer, using: 'user_id::integer'
    change_column :enrollments, :course_id, :integer, using: 'course_id::integer'
  end
end
