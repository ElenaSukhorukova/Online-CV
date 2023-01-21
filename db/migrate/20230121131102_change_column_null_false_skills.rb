class ChangeColumnNullFalseSkills < ActiveRecord::Migration[7.0]
  def change
    change_column_null :skills, :skillname, false
    change_column_null :skills, :locale, false
    change_column_null :skills, :user_id, false
  end
end
