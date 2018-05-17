class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient]) unless params[:dose][:ingredient].blank?
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
     render :new
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end


private

  def dose_params
    params.require(:dose).permit(:description)
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
end

