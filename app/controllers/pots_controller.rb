class PotsController < ApplicationController

  before_action :set_pot, only: [:show, :edit, :update]

  def index
    @pots = Pot.all
  end

  def show
    @first_gift = @pot.gifts.first
  end

  def new
    @pot = Pot.new
  end

  def create
    @pot = Pot.new(pot_params)
    @pot.owner = current_user

    if @pot.save
      redirect_to pot_path(@pot.id), notice: "Well done!! You just created a POT"
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
    params.require(:pot).permit(:name, :description, :min_amount, :end_date, :owner)
  end

  def set_pot
    @pot = Pot.find(params[:id])
  end
end
