class CreateSubTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :sub_tasks do |t|
      t.string :title
      t.text :description
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
