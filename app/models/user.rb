class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  after_create :create_profile

  scope :last_five_records, -> { order(created_at: :desc).limit(5) }

  def create_profile
    self.build_profile.save(validate: false)
  end
end
