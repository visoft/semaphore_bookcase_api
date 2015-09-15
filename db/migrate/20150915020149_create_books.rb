class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :cover
      t.references :publisher, index: true, foreign_key: true

      t.timestamps
    end
  end
end
