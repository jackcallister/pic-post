class SessionsController < ApplicationController

  def connect
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token
    redirect_to new_post_card_path
  end

  def destroy
    session[:access_token] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
