class PotsController < ApplicationController

  before_action :set_pot, only: [:show, :edit, :update]

  def index
    @pots = Pot.all
  end

  def show
  end

  def new
    @pot = Pot.new
  end

  def create
    @pot = Pot.new(pot_params)
     
    if @pot.save
      redirect_to pot_path(@pot), notice: "Well done!! You just created a POT"
    else
      render :new
    end 
  end

  def edit 
  end

  def update
    @pot.update(params[:pot])
  end


  private

  def pot_params
    params.require(:pot).permit(:name)
  end

  def set_pot
    @pot = Pot.find(params[:id])
  end
end
