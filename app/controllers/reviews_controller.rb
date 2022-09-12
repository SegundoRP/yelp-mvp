class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    # esto del restuaratn es porque en la vista new se necesita que este con el restaurant correcto, mira la vista new
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(reviews_params)
    @review.restaurant = @restaurant
    # aca generamos la relacion y cuando crea el review lo pone en el restaurante correcto
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
      # , status: :unprocessable_entity  esto es para rails 7 luego del render :new
    end
    # el condicional es para cuando falle el ingreso de la review por algun motivo como mal ingreso de datos lo regrese
    # a la misma vista o lo mande a la vista de review
  end

  private

  def reviews_params
    params.require(:review).permit(:rating, :content)
  end
end
