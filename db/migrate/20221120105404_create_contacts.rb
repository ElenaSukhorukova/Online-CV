# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.text :address
      t.string :email
      t.string :phone
      t.string :linkedin
      t.string :github
      t.string :telegram
      t.string :locale
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
