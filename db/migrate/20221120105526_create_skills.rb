class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :skillname
      t.text :description
      t.string :locale
      t.belongs_to :user, foreign_key: true
      
      t.timestamps
    end
  end
end
