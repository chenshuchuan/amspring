class CategoryController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:index, :destroy, :create]

  def index
  end

  def create
  	@category = Category.new
  	@category.name = params[:name]
  	@category.save
    respond_to do |format|
      format.js 
    end   	
  end

  def destroy
  	 @category.destroy
  	 respond_to do |format|
      format.js 
     end 
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def set_categories
    	@categories = Category.all
    end
end
