# frozen_string_literal: true

class CocktailsController < ApplicationController
  def index
    # get all the cocktails
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    # use params to find cocktail we jut clicked on
  end

  def new
    # Y u need this?
    @cocktail = Cocktail.new
  end

  def create
    # this is saving the data from the form in a cocktail instance
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
end
