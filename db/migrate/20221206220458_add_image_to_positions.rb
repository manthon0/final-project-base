class AddImageToPositions < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :stage, :string
  end
end
