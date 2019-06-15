class CreatePoetries < ActiveRecord::Migration[5.2]
  def change
    create_table :poetries do |t|
      t.integer :poem_id
      t.text :content
      t.string :author

      t.timestamps
    end
  end
end
