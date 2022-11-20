class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :coursename
      t.text :description
      t.date :data_of_end
      t.string :locale    
      t.belongs_to :user, foreign_key: true
      
      t.timestamps
    end
  end
end
