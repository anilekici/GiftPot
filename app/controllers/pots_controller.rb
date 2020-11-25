class PotsController < ApplicationController
  before_action :set_pot, only: [:show, :edit, :update, :destroy, :finish, :join]

  def index
    @pots = Pot.all
  end

  def show
    @first_gift = @pot.gifts.first
    # @ordered_gifts = @pot.gifts.joins(:gift_votes).group(:id, :gift_votes).order(:gift_votes)
    @ordered_gifts = @pot.gifts.left_joins(:gift_votes).group(:id).select('gifts.*', 'COUNT(gift_votes.id) vote_count').order('vote_count DESC')
    @winner_gift = @ordered_gifts.first
    @gift = Gift.new
    @contribution = Contribution.where(user: current_user, pot: @pot).first
    @user = current_user
  end

  def new
    @pot = Pot.new
  end

  def create
    @pot = Pot.new(pot_params)
    @pot.owner = current_user
    @pot.chatroom = Chatroom.create(name: "#{@pot.name}'s Chatroom")

    if @pot.save
      redirect_to pot_path(@pot.id), notice: "Well done!! You just created a POT"
    else
      render :new
    end
  end


  # def edit
  # end

  # def update
  #   @pot.update(pot_params)
  # end

  def finish
    @pot.active = false
    @pot.save
    redirect_to pot_path(@pot)
  end

  def destroy
    @pot.destroy
    redirect_to dashboard_path
  end

  def join
    @user = current_user
    if @pot.users.include? @user
      redirect_to pot_path(@pot), alert: "You already a member of this pot"
    else
      @users_pot = UsersPot.create(pot: @pot, user: @user)
      @users_pot.save
      redirect_to pot_path(@pot), notice: "You successfully joined this pot"
    end
  end

  def destroy
    @pot.destroy
    redirect_to dashboard_path
  end

  def leave
    @user = current_user
    set_pot
    if @pot.users.include? @user
      @users_pot = UsersPot.find_by user: current_user
      @users_pot.destroy
      redirect_to dashboard_path, notice: "You successfully left #{@pot.name}"
    else
      redirect_to pot_path(@pot), alert: "You aren't a member of this pot"
    end
  end

  private

  def pot_params
    params.require(:pot).permit(:name, :description, :min_amount, :end_date, :owner)
  end

  def set_pot
    @pot = Pot.find(params[:id])
  end

  def contribution_params
    params.require(:contribution).permit(:amount)
  end
end
