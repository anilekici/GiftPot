class ChatroomsController < ApplicationController
  def index
    @pots = current_user.pots
    @owned_pots = current_user.owned_pots
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
