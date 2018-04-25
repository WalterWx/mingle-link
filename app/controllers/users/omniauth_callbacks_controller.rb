# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
   skip_before_action :verify_authenticity_token

   def sign_in_with(provider_name)
     @user = User.from_omniauth(request.env["omniauth.auth"])
     sign_in_and_redirect @user, :event => :authentication
     set_flash_message(:notice, :success, :kind => provider_name) if is_navigational_format?
   end

   def facebook
     sign_in_with "Facebook"
   end

   def linkedin
#       omniauth_hash = request.env["omniauth.auth"]

# u = User.new(:email => omniauth_hash["email"], :password => 'password', :password_confirmation => 'password' )
# u.save
    # redirect_to root_path, :notice => "You've successfully connected your LinkedIn account."
     sign_in_with "LinkedIn"
   end

   def twitter
     sign_in_with "Twitter"
   end

   def google_oauth2
     sign_in_with "Google"
   end

   def developer
     sign_in_with "Developer"
   end
end
