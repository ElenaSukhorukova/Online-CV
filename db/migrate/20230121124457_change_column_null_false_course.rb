class ChangeColumnNullFalseCourse < ActiveRecord::Migration[7.0]
  def change
    change_column_null :courses, :coursename, false
    change_column_null :courses, :description, false
    change_column_null :courses, :date_of_end, false
    change_column_null :courses, :locale, false
    change_column_null :courses, :user_id, false
  end
end
