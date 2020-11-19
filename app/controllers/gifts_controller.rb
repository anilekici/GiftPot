class GiftsController < ApplicationController
  before_action :set_gift, only: [:edit, :destroy, :upvote, :downvote]
  before_action :set_pot, only: [:edit, :destroy, :upvote, :downvote]
    
  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    @gift.save
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
    @user = current_user
    @gift_vote = GiftVote.find_by(gift: @gift, user: current_user)
    @gift_vote.destroy
    raise
    redirect_to pot_path(@pot)
  end

  private

  def gift_params
    params.require(:gift).permit(:pot_id)
  end

  def set_gift
    @gift = Gift.find(params[:gift_id])
  end

  def set_pot
    @pot = Pot.find(params[:id])
  end

end
