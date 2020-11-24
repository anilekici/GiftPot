class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
  end

  def thankyou
    @pot = Pot.find(params[:pot_id])
    @contributions = @pot.contributions
      sum = 0
    @contributions.each do |contribution|
      sum += contribution.amount_cents
    end
      @pot.total_amount = sum
      @pot.save
      redirect_to pot_path(@pot)
  end

end
