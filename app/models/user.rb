class User < ApplicationRecord
  	
    has_many :events_users
  	has_many :events, through: :events_users
    has_many :groups_users
  	has_many :groups, through: :groups_users

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, omniauth_providers: %i[linkedin]

  def self.from_omniauth(auth)
  	if self.where(email: auth.info.email).exists?
  		return_user = self.where(email: auth.info.email).first
  		return_user.provider = auth.provider
  		return_user.uid = auth.uid
  	else
  		return_user = self.create do |user|
  			user.password = Devise.friendly_token[0,20]
  			user.provider = auth.provider
  			user.uid = auth.uid
  			user.email = auth.info.email
  			user.expires_at = Time.at(auth.credentials.expires_at) 
  			user.token = auth.credentials.token
  			user.first_name = auth.info.first_name
  			user.last_name = auth.info.last_name
  			user.description = auth.info.description
  			user.public_profile_url = auth.info.urls["public_profile"]
  			user.location = auth.info.token
  			user.image = auth.info.image

  		end
  	end

  	return_user
  end
end