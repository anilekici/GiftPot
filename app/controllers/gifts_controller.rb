class GiftsController < ApplicationController

  before_action :set_gift, only: [:edit, :destroy]

  def index
    @gifts = Gift.all
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    @gift.save
  end

  def edit
  end

  def update
    @gift.votes = @gift.votes + 1
  end

  def destroy
    @gift.destroy

    redirect_to pot_path(@pot), alert: "Your Gift has been deleted"
  end

  private

  def gift_params
    params.require(:gift).permit(:pot_id)
  end

  def set_gift
    @gift = Gift.find(params[:gift_id])
  end

end
