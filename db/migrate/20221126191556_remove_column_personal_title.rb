# frozen_string_literal: true

class RemoveColumnPersonalTitle < ActiveRecord::Migration[7.0]
  def change
    remove_column :personal_details, :title, :string
  end
end
