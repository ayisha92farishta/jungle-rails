require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validations tests/examples here

    it 'should save a product sucessfully with valid attributes' do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Random_product",price_cents: 1000, quantity: 100, :category => @category )
      @product.save!
      expect(@product.id).to be_present
    end

    it 'should not create a product if the name is missing' do
      @category = Category.new(name: "Testing")
      @product = Product.new(price_cents: 1000, quantity: 100, :category => @category)
      @product.valid?
      expect(@product.errors[:name]).to include("can\'t be blank")
    end

    it 'should not create a product if the price is missing' do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Random_product", quantity: 100, :category => @category)
      @product.valid?
      expect(@product.errors[:price]).to include("can\'t be blank")
    end

    it 'should not create a product if the quantity is missing' do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Random_product",price_cents: 1000, :category => @category )
      @product.valid?
      expect(@product.errors[:quantity]).to include("can\'t be blank")
    end

    it 'should not create a product if the category is missing' do
      @product = Product.new(name: "Random_product",price_cents: 1000, )
      @product.valid?
      expect(@product.errors[:category]).to include("can\'t be blank")
    end
    
  end
end