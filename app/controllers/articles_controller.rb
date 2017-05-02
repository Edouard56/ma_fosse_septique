class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :new_client

  def choix_assainissement_individuel_ou_collectif
  end

  private

  def new_client
    @client = Client.new
  end

end

