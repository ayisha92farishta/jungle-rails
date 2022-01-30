require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'user should save with proper validations' do
      @user = User.new(first_name: "Anna", 
      last_name: "Kornikova", email: 'abd@gmail.com', password: "asdqwe", password_confirmation: "asdqwe")

      @user.save

      expect(@user.id).to be_present
    end
  end
end