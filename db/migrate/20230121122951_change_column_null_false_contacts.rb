# frozen_string_literal: true

class ChangeColumnNullFalseContacts < ActiveRecord::Migration[7.0]
  def change
    change_column_null :contacts, :address, false
    change_column_null :contacts, :email, false
    change_column_null :contacts, :phone, false
    change_column_null :contacts, :linkedin, false
    change_column_null :contacts, :github, false
    change_column_null :contacts, :telegram, false
    change_column_null :contacts, :locale, false
    change_column_null :contacts, :user_id, false
  end
end
