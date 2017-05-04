class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :new_client

  def legislation_2017
  end

  def actualite_juridique
  end

  private

  def new_client
    @client = Client.new
  end



end

