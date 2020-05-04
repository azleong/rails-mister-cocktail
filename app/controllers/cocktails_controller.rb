# frozen_string_literal: true

class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    #get all the cocktails
    @cocktails = Cocktail.all
  end

  def show
  #use params to find cocktail we clicked on before
  end

  def new
    #because simple form needs an instance?
    @cocktail = Cocktail.new
  end

  def create
    #save data from the form in a cocktail instance
    @cocktail = Cocktail.new(cocktail_params)
    # save it in the DB
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  private

  def cocktail_params
    # only keep what we want from the params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
