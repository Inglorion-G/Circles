# == Schema Information
#
# Table name: circles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  owner_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Circle < ActiveRecord::Base
  validates :name, :owner, presence: true

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id
  )

  has_many(
    :circle_memberships,
    class_name: "CircleMembership",
    foreign_key: :circle_id,
    primary_key: :id,
    inverse_of: :circle
  )

  has_many(
    :post_shares,
    class_name: "PostShare",
    foreign_key: :circle_id,
    primary_key: :id,
    inverse_of: :circle
  )

  has_many :members, through: :circle_memberships, source: :member

end
