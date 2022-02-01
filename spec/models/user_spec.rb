require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save with proper attributes' do
      @user = User.new(first_name: "Anna", 
      last_name: "Kornikova", email: 'abd@gmail.com', password: "asdqwe", password_confirmation: "asdqwe")

      @user.save

      expect(@user.id).to be_present
    end

    it 'should not save if password does not match with password_confirmation' do
    @user = User.new(first_name: "Anna", 
    last_name: "Kornikova", email: 'abd@gmail.com', password: "asdqwe", password_confirmation: "qweasd")

    @user.valid?

    expect(@user.errors[:password])
   end

    it 'should not log in if email already exists by another user'

    it 'should not save if first name is not present' do
      @user = User.new( last_name: "Kornikova", email: 'abd@gmail.com', password: "asdqwe", password_confirmation: "asdqwe")

      @user.valid?

      expect(@user.errors[:first_name])
    end
    
    it 'should not save if last name is not present' do
      @user = User.new(first_name: "Anna", email: 'abd@gmail.com', password: "asdqwe", password_confirmation: "asdqwe")
      @user.valid?

      expect(@user.errors[:last_name])

    end

    it 'should not save if email is not present'

    it 'should not save due to length of password being to small'
  end

  describe '.authenticate_with_credentials' do

    it 'should return the user if successfully authenticated' do
      user1 = User.new(:name => 'abc', :email => 'abc@gmail.com', :password => 'abc@123', :password_confirmation => 'abc@123')
      user1.save
      @user = User.authenticate_with_credentials('abc@gmail.com', 'abc@123')
      expect(@user).to be_present
    end

  #   it 'Authenticate' 
  #   # do
  #   #   User.create(:email => 'abd@gmail.com', :password => "asdqwe")
  #   #   @user = User.authenticate_with_credentials(
  #   #     'abd@gmail.com','asdqwe')
  #   #   expect(@user).to be_truthy
  #   # end
  # end

  
end