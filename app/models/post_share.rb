# == Schema Information
#
# Table name: post_shares
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  circle_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class PostShare < ActiveRecord::Base
  validates :circle, :post, presence: true

  belongs_to(
    :circle,
    class_name: "Circle",
    foreign_key: :circle_id,
    primary_key: :id,
    inverse_of: :post_share
  )

  belongs_to(
    :post,
    class_name: "Post",
    foreign_key: :circle_id,
    primary_key: :id,
    inverse_of: :post_share
  )
end
