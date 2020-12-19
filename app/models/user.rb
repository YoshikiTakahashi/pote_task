class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook]


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

  
  # def self.find_for_oauth(auth)
  #   user = User.where(uid: auth.uid, provider: auth.provider).first
  #     unless user
  #       user = User.create(
  #         uid:      auth.uid,
  #         provider: auth.provider,
  #         email:    auth.info.email,
  #         password: Devise.friendly_token[0, 20]
  #       )
  #     end
  #   user
  # end
end
