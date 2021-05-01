class User < ActiveRecord::Base
  has_secure_password
  has_many :vinyls
  validates :username, uniqueness: true
end