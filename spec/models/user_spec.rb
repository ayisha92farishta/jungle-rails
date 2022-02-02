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

   it 'should validate uniqueness of email that are case_sensitive' do
    @user = User.new(first_name: "Anna", 
    last_name: "Kornikova", :email => 'efg@gmail.com', :password => 'efg@123', :password_confirmation => 'efg@123')
    @user.save
    @user2 = User.new(first_name: "LeBron", 
    last_name: "James", :email => 'EFG@gmail.com', :password => 'abc@123', :password_confirmation => 'abc@123')
    expect(@user2).to_not be_valid
  end

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

    it 'should not save if email is not present' do
      @user = User.new(first_name: "Anna", :last_name => 'Kornikova', email: 'abd@gmail.com', :email => nil, :password => 'efg@123', :password_confirmation => 'efg@123')
      @user.save
      expect(@user.email).to_not be_present
    end

    it 'should not save due to length of password being too small' do
    @user = User.new(:first_name => 'Anna', :last_name => 'Kornikova', :email => 'xyz@gmail.com', :password => '123ve', :password_confirmation => '123ve')
    @user.save
    expect(@user).to_not be_valid
  end
  end

  describe '.authenticate_with_credentials' do

    it 'should return the user if successfully authenticated' do
      user1 = User.new(:first_name => 'Anna', :last_name => 'Kornikova', :email => 'abc@gmail.com', :password => 'abc@123', :password_confirmation => 'abc@123')
      user1.save
      @user = User.authenticate_with_credentials('abc@gmail.com', 'abc@123')
      expect(@user).to be_present
    end

    it 'should allow the user to login even when all the letters in email are uppercase' do
      user1 = User.new(:first_name => 'abc', :last_name => 'efg', :email => 'abc@gmail.com', :password => 'abc@123', :password_confirmation => 'abc@123')
      user1.save
      @user = User.authenticate_with_credentials('ABC@gmail.com', 'abc@123')
      expect(@user).to be_present
    end
    it 'should allow the user to login when there is space before or after email' do
      user1 = User.new(:first_name => 'abc', :last_name => 'efg', :email => 'abc@gmail.com', :password => 'abc@123', :password_confirmation => 'abc@123')
      user1.save
      @user = User.authenticate_with_credentials(' abc@gmail.com', 'abc@123')
      expect(@user).to be_present
    end
  end

  
end