# == Schema Information
#
# Table name: positions
#
#  id          :integer          not null, primary key
#  best_move   :string
#  board_state :text
#  evaluation  :float
#  notes       :string
#  stage       :string
#  whose_turn  :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Position < ApplicationRecord

  has_many(:collection_positions, { :class_name => "CollectionPosition", :foreign_key => "position_id", :dependent => :destroy })
  has_many(:collections, { :through => :collection_positions, :source => :collection })
  validates(:board_state, { :presence => true })

end
