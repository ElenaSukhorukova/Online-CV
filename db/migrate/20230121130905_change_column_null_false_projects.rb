class ChangeColumnNullFalseProjects < ActiveRecord::Migration[7.0]
  def change
    change_column_null :projects, :title, false
    change_column_null :projects, :github, false
    change_column_null :projects, :description, false
    change_column_null :projects, :locale, false
    change_column_null :projects, :user_id, false
  end
end
