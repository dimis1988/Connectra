class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts
  after_create :create_profile

  scope :last_five_users, -> { order(created_at: :desc).limit(5) }

  def create_profile
    self.build_profile.save(validate: false)
  end
end
