class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.float :price
      t.string :date
      t.string :location
      t.string :genre

      t.timestamps
    end
  end
end
