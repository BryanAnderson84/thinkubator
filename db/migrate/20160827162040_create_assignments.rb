class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.text :response
      t.boolean :completed
      t.belongs_to :user
      t.belongs_to :idea

      t.timestamps
    end
  end
end
