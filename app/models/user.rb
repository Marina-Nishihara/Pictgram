class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  
  has_secure_password
  #validates :password, length: { in: 8..32 }
  
  PW_REGEX = /\A(?=.?[a-z])(?=.?\d)[a-z\d]{8,32}\z/i
  validates :password, presence: true, format: { with: PW_REGEX }
  
end