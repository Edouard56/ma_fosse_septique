class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @client = Client.new

    @users = User.all
    @users = User.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end

  def show
    @client = Client.new
    @user = User.find(params[:id])
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   @user.save

  #   redirect_to users_path
  # end


  # def edit
  #    @user = User.find(params[:id])
  # end

  # def update
  #   @user = User.find(params[:id])
  #   @user.update(user_params)

  #   redirect_to user_path(@user)
  # end


  private

  def user_params
    params.require(:user).permit(:company, :first_name, :last_name, :position, :mobile_phone, :office_phone, :email, :address, :description, :radius, :photo_company_logo, :photo_presentation, photos_projet_1: [], photos_projet_2: [], photos_projet_3: [], photos_projet_4: [])
  end

  def set_user
    @user = User.find(params[:id])
  end

end
