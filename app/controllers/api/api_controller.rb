class Api::ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user_from_token!
  before_action :authenticate_user!

  respond_to :json

  private

    def authenticate_user_from_token!
      auth_token = params[:token].presence
      user       = auth_token && User.where(:authentication_token => auth_token.to_s).first

      if user
        # Notice we are passing store false, so the user is not
        # actually stored in the session and a token is needed
        # for every request. If you want the token to work as a
        # sign in token, you can simply remove store: false.
        sign_in user, store: false
        @current_user = user
      end
    end

end
