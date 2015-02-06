class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :word
      t.text :definition
      t.boolean :solved
      t.belongs_to :deck
      t.timestamps
    end
  end
end
