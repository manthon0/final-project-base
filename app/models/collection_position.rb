# == Schema Information
#
# Table name: collection_positions
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  collection_id :integer
#  position_id   :integer
#
class CollectionPosition < ApplicationRecord
  belongs_to(:position, { :required => true, :class_name => "Position", :foreign_key => "position_id" })
  belongs_to(:collection, { :required => true, :class_name => "Collection", :foreign_key => "collection_id" })

end
