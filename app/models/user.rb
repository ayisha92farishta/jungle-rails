class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, confirmation: true, length: {minimum: 6 }
  validates :email, uniqueness: {case_sensitive: false}

  def self.authenticate_with_credentials(email, password)
    if email == email.upcase! 
      correct_email = email.downcase!
    else
      correct_email = email
    end
    # Use squish to remove white spaces if any
    @user = User.find_by email:correct_email.squish 
    if @user.authenticate(password)
      @user
    else
      nil
    end
  end

end