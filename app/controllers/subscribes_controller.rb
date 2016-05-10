class SubscribesController < ApplicationController
  before_filter :authenticate_user!

  def new
  end

  def show

  end

  def edit

  end

  def update
    token = params[:stripeToken]
    customer = Stripe::Customer.create(
        card: token,
        plan: 'monthly',
        email: current_user.email
    )
    current_user.subscribed = true
    current_user.stripeid = customer.id
    current_user.save
    redirect_to todos_path, notice: 'Thank you for subscription.'
  end

  def destroy

  end

  private

  def set_subscribe

  end

  def subscribe_params

  end
end
