class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.string :name_organization
      t.string :degree
      t.text :field_of_study
      t.date :date_of_end
      t.string :locale
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
