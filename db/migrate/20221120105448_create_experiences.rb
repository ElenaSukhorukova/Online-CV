class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.string :employer
      t.string :position
      t.date :date_of_begin
      t.date :date_of_end
      t.text :description
      t.string :locale
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
