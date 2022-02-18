class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @contacts = @user.contacts
    @contacts_count = @contacts.count
    @total_phones = count_telephones(@contacts)
  end

  def new
    @user = User.new(user_name: params[:name], birthday: params[:birthday], bio: params[:bio])
  end

  def create
    @user = User.new(user_name: params[:name], birthday: params[:birthday], bio: params[:bio])
    if @user.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to :action => 'show', id => @user
    else
      render action: 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to action: 'show'
  end

  private

  def user_params
    params.require(:name).permit(:birthday, :bio)
  end

  def count_telephones(contacts)
    count = 0
    contacts.each do |contact|
      count += contact.telephones.count
    end
    count
  end
end
