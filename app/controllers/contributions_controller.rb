class ContributionsController < ApplicationController
  before_action :set_pot, only: [:create, :show]

  def new
    @contribution = Contribution.new
  end

  def create
    @pot = Pot.find(params[:pot_id])
    @contribution = Contribution.new(contribution_params)
  end

  private

  def contribution_params
    params.require(:contribution).permit(:pot_id, :name)
  end

  def set_pot
    @pot = Pot.find(params[:id])
  end
end
