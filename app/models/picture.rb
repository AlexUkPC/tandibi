# == Schema Information
#
# Table name: pictures
#
#  id         :bigint           not null, primary key
#  caption    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
class Picture < ApplicationRecord
  belongs_to :post
  has_many_attached :file
end
