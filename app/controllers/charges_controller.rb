class ChargesController < ApplicationController
  before_filter :set_post_card, only: :create

  def new
  end

  def create
    customer = Stripe::Customer.create(card: params[:stripeToken])

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 500,
      description: 'Pic post customer',
      currency: 'AUD'
    )

    if charge.paid
      @post_card.paid = true
      @post_card.save
      @post_card.send(:print!)
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path
  end

  private

  def set_post_card
    @post_card = PostCard.find(params[:post_card_id])
  end
end
