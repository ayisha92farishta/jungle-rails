class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD']



  def show
    @total_products = Product.all
    @product_count = Product.all.count
    @product_sum = Product.sum(:quantity)
    @catagory_count = Category.all.count
    end
end
