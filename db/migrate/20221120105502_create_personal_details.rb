class CreatePersonalDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_details do |t|
      t.string :title
      t.string :full_name
      t.string :position
      t.text :about
      t.string :locale
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
