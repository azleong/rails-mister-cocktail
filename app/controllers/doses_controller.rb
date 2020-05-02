class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]
  
  def new
    @cocktail = Cocktail.find(params[:dose_id])
    @dose = Dose.new
  end
  
  def create 
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose.destroy
    redirect_to cocktails_path
  end
  
  private
  def dose_params
    params.require(:dose).permit(:description)
  end
  
  def set_dose
    @dose = Dose.find_by(params[:description])   
  end

end
