# == Schema Information
#
# Table name: circle_memberships
#
#  id         :integer          not null, primary key
#  circle_id  :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class CircleMembership < ActiveRecord::Base
  validates :circle, :member, presence: true

  belongs_to(
    :member,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id,
    inverse_of: :circle_memberships
  )

  belongs_to(
    :circle,
    class_name: "Circle",
    foreign_key: :circle_id,
    primary_key: :id,
    inverse_of: :circle_memberships
  )

end
