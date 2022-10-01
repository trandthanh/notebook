class AddColumnsToNotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :folder, null: false, foreign_key: true
    add_column :notes, :content, :text
  end
end
