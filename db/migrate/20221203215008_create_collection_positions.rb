class CreateCollectionPositions < ActiveRecord::Migration[6.0]
  def change
    create_table :collection_positions do |t|
      t.integer :collection_id
      t.integer :position_id

      t.timestamps
    end
  end
end
