class ChangeColumnNullFalseExperiences < ActiveRecord::Migration[7.0]
  def change
    change_column_null :experiences, :employer, false
    change_column_null :experiences, :position, false
    change_column_null :experiences, :date_of_begin, false
    change_column_null :experiences, :description, false
    change_column_null :experiences, :locale, false
    change_column_null :experiences, :user_id, false
  end
end
