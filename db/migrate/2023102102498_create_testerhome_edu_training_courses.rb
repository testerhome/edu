class CreateTesterhomeEduTrainingCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :training_courses do |t|
      t.string :title
      t.string :author
      t.text :description
      t.string :price
      t.string :courseUrlOfXiaoETong
      t.integer :courseType
      t.boolean :published
      t.boolean :suggested
      t.string :cover
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
