# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  validates :author, presence: true

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :links,
    class_name: "Link",
    foreign_key: :post_id,
    primary_key: :id
  )

  has_many(
    :shares,
    class_name: "PostShare",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :post
  )
end