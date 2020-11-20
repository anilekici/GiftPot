class GiftsController < ApplicationController
  before_action :set_gift, only: [:edit, :destroy, :upvote, :downvote]
  before_action :set_pot, only: [:edit, :destroy, :upvote, :downvote]
    
  def new
    @gift = Gift.new
  end

  def create
    @pot = Pot.find(params[:pot_id])
    @gift = Gift.new(gift_params)
    @gift.pot = @pot
    @gift.save
    if @gift.save
      redirect_to pot_path(@pot.id), notice: "Well done!! You added a Gift Option"
    else
      redirect_to pot_path(@pot.id)
    end
  end

  def destroy
    @gift.destroy

    redirect_to pot_path(@pot), alert: "Your Gift has been deleted"
  end

  def upvote
    @gift_vote = GiftVote.create(gift: @gift, user: current_user)
    redirect_to pot_path(@pot)
  end

  def downvote
    @gift_vote = GiftVote.find_by(gift: @gift, user: current_user)
    @gift_vote.destroy
    redirect_to pot_path(@pot)
  end

  private

  def gift_params
    params.require(:gift).permit(:pot_id, :name)
  end

  def set_gift
    @gift = Gift.find(params[:gift_id])
  end

  def set_pot
    @pot = Pot.find(params[:id])
  end

end
