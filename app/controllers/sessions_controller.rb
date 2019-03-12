class SessionsController < ApplicationController
  require "digest"

  def index
    redirect_to controller: 'titles', action: 'main' if current_user
  end

  def auth
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, alert: 'Authenticated'
    else
      redirect_to root_path, alert: 'Password/Login are incorrect'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, alert: 'Logged Out'
  end
end

def encrypt_md5(text)
  Digest::MD5.hexdigest text
end