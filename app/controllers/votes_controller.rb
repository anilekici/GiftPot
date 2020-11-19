class VotesController < ApplicationController
  def upvote
    @pot = Pot.find(params[:id])
    @gifts = @pot.gifts
    
  end
end
