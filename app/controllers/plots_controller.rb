class PlotsController < ApplicationController
  def index
    @plots = Plot.includes(:plants).all
  end
  
  # def show
    
  # end

  # def new
    
  # end

  # def create
    
  # end

  # def edit
    
  # end

  # def update
    
  # end

  # def destroy
    
  # end

  # private

  # def _params
  #   params.permit(:)
  # end
end