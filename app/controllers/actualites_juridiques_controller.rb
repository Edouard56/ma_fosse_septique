class ActualitesJuridiquesController < ApplicationController
  skip_before_action :authenticate_user!

  def home_actualite_juridique
  end

  def legislation
  end

end
