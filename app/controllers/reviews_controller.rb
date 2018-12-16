class ReviewsController < ApplicationController
  before_action :set_cocktail, only: :create

  def create
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      @dose = Dose.new
      render 'cocktails/show'
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    # MIND THAT...
    #1 - You need to *whitelist* what can be updated by the user
    #2 - Never trust user data!!
    params.require(:review).permit(:content, :rating)
  end
end
