require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save with proper validations' do
      @user = User.new(first_name: "Anna", 
      last_name: "Kornikova", email: 'abd@gmail.com', password: "asdqwe", password_confirmation: "asdqwe")

      @user.save

      expect(@user.id).to be_present
    end

    it 'should not save if password does not match with password_confirmation'

    it 'should not log in if email already exists by another user'

    it 'should not save if first name is not present'
    
    it 'should not save if last name is not present'

    it 'should not save if email is not present'

    it 'should not save due to length of password being to small'

  end
end