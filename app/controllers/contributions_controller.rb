class ContributionsController < ApplicationController
  before_action :set_pot, only: [:new, :create, :show]
  before_action :set_user, only: [:new, :create, :show]

  def new
    @contribution = Contribution.new
  end

  def create
    @pot = Pot.find(params[:pot_id])
    @contribution = Contribution.new(contribution_params)
    @contribution.contribution_sku = 111
    @contribution.pot = @pot
    @contribution.user = @user
    @contribution.amount = params[:contribution][:amount].to_i
    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @contribution.contribution_sku,
      amount: @contribution.amount_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: pot_thankyou_url(@pot),
    cancel_url: new_pot_contribution_url(@pot)
  )
    if @contribution.save
      @contribution.update(session_id: session.id)
      redirect_to new_pot_contribution_payment_path(@pot, @contribution)
    else
      redirect_to new_pot_contribution_path(@pot)
    end
  end

  def show
    #may not need
  end

  private

  def contribution_params
    params.require(:contribution).permit(:amount)
  end

  def user_params
    params.require(:user).permit(:user_id, :name)
  end

  def set_pot
    @pot = Pot.find(params[:pot_id])
  end

  def set_user
    @user = current_user
  end
end
