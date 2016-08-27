class CreateSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestions do |t|
      t.string :content
      t.string :contribute
      t.belongs_to :user
      t.belongs_to :idea

      t.timestamps
    end
  end
end
