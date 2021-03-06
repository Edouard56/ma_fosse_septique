class ClientsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create, :show ]

   before_action :set_client, only: [:show, :edit, :update]

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.save

    redirect_to client_path(@client)
  end

  def show
    @available_users = []
    User.all.each do |user|
      beta = @client.distance_to(user.address).to_i
      if beta < user.radius
        @available_users << user
      end
    end

    @hash = Gmaps4rails.build_markers(@available_users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow render_to_string(partial: "/clients/map_box", locals: { user: user })
    end
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :phone_number, :email, :address)
  end

  def set_client
    @client = Client.find(params[:id])
  end

end
