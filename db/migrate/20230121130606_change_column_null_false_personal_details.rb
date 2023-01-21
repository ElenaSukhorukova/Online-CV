class ChangeColumnNullFalsePersonalDetails < ActiveRecord::Migration[7.0]
  def change
    change_column_null :personal_details, :full_name, false
    change_column_null :personal_details, :position, false
    change_column_null :personal_details, :about, false
    change_column_null :personal_details, :locale, false
    change_column_null :personal_details, :user_id, false
  end
end
