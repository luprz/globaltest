class CreateArrayLists < ActiveRecord::Migration[5.1]
  def change
    create_table :array_lists do |t|
      t.string :data

      t.timestamps
    end
  end
end
