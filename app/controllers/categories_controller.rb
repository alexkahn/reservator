class CategoriesController < ApplicationController
  def index
    @categories = Category.select(:id, :name).all
  end

  def show
    @category = Category.includes(:restaurants).find(params[:id])
  end
end
