class ContributionsController < ApplicationController
  before_action :set_pot, only: [:new, :create, :show]

  def new
    @contribution = Contribution.new
  end

  def create
    @pot = Pot.find(params[:pot_id])
    @contribution = Contribution.new(contribution_params)
  end

  def show
    #may not need
  end

  private

  def contribution_params
    params.require(:contribution).permit(:pot_id, :name)
  end

  def set_pot
    @pot = Pot.find(params[:pot_id])
  end
end
