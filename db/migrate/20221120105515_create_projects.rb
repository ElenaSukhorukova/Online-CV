class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :site
      t.string :github
      t.text :description
      t.string :locale
      t.belongs_to :user, foreign_key: true
      
      t.timestamps
    end
  end
end
