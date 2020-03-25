class ItemsController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
  end

  def create
  end

end
