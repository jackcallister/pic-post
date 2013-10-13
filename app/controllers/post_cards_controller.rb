class PostCardsController < ApplicationController
  before_filter :get_image_urls, only: [:new]
  before_filter :set_post_card, only: [:show]

  def new
    @post_card = PostCard.new
  end

  def create
    @post_card = PostCard.new(post_card_params)
    respond_to do |format|
      if @post_card.save
        format.html { redirect_to new_post_card_charge_path(@post_card), notice: 'Success' }
        format.json { render action: 'show', status: :created, location: @post_card }
      else
        format.html { render action: 'new' }
        format.json { render json: @post_card.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def get_image_urls
    if session[:image_urls].nil?
      response = Instagram.user_recent_media(access_token: session[:access_token])
      @image_urls = []

      response.each do |object|
        @image_urls << object.images.standard_resolution.url
      end
      session[:image_urls] = @image_urls
    else
      @image_urls = session[:image_urls]
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post_card
    @post_card = PostCard.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_card_params
    params[:post_card].permit!
  end
end
