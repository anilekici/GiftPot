class PaymentsController < ApplicationController
before_action :set_pot, only: [:new]

  def new
    @contribution = current_user.contributions.find(params[:contribution_id])
  end

 private

 def set_pot
  @pot = Pot.find(params[:pot_id])
 end

end
