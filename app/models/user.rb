# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  token           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password
  before_validation :ensure_token

  validates :email, :password_digest, :token, presence: true
  validates :email, :token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many(
    :owned_circles,
    class_name: "Circle",
    foreign_key: :owner_id,
    primary_key: :id
  )

  has_many(
    :circle_memberships,
    class_name: "CircleMembership",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :posts,
    class_name: "Post",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many :circles, through: :circle_memberships, source: :circle
  has_many :shared_posts, through: :circles, source: :shared_posts

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    user.try(:is_password?, password) ? user : nil
  end

  def password=(plain_text)
    @password = plain_text
    self.password_digest = BCrypt::Password.create(plain_text)
  end

  def is_password?(plain_text)
    BCrypt::Password.new(self.password_digest).is_password?(plain_text)
  end

  def reset_token!
    self.token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.token
  end

  private

  def ensure_token
    self.token ||= reset_token!
  end
end
