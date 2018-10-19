class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :enrollments, :course_code, :course_id
  end
end
