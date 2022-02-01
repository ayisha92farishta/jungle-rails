class User < ActiveRecord::Base

  validates :email, uniqueness :true

  def create
    if user = Use
  end


  has_secure_password

end