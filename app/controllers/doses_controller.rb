class DosesController < ApplicationController

  def new
    # Get cocktail from the URL 
    @cocktail = Cocktail.find(params[:cocktail_id])
    # simple_form needs an instance 
    @dose = Dose.new
  end

  def create
    # Get the cocktail from the URL 
    @cocktail = Cocktail.find(params[:cocktail_id])
    # Save the data from the form in a dose instance 
    @dose = Dose.new(dose_params)
    # Link the dose and cocktail together
    @dose.cocktail = @cocktail
    # save it in the DB
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
