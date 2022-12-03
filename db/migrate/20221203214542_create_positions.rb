class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.text :board_state
      t.string :best_move
      t.float :evaluation
      t.boolean :whose_turn
      t.string :notes

      t.timestamps
    end
  end
end
