class MagazineController < ApplicationController
  skip_before_action :authenticate_user!
  # before_action :new_client

  def index
  end

  def home_actualite_juridique
  end

  def legislation
  end

  def legislation_2017
  end

  private

  def new_client
    @client = Client.new
  end


end
