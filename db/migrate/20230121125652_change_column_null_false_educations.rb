class ChangeColumnNullFalseEducations < ActiveRecord::Migration[7.0]
  def change
    change_column_null :educations, :name_organization, false
    change_column_null :educations, :degree, false
    change_column_null :educations, :field_of_study, false
    change_column_null :educations, :date_of_end, false
    change_column_null :educations, :locale, false
    change_column_null :educations, :user_id, false
  end
end
