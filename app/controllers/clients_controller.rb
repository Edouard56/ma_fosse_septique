class ClientsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create, :show ]

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to client_confirmation_path(@client)
    else
      render :new
    end
  end

  def show
  end

 private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :address, :phone_number, :email)
  end

end
