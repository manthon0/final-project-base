# == Schema Information
#
# Table name: collections
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Collection < ApplicationRecord

  has_many(:collection_positions, { :class_name => "CollectionPosition", :foreign_key => "collection_id", :dependent => :destroy })
  has_many(:positions, { :through => :collection_positions, :source => :position })

end
