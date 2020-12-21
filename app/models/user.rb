class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook]
  has_many :photos, dependent: :destroy

  before_save { self.email = email.downcase }
  validates :user_name, presence: true, length: { in: 3..50}
  validates :pen_name, presence: true, length: { in: 3..50}
  validates :email, uniqueness: { case_sensitive: false }
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.user_name = auth.info.name
      user.pen_name = auth.info.name
      user.skip_confirmation!
      # user.skip_reconfirmation!
    end
  end


  def feed
    Photo.where("user_id = ?", id)
  end
end
