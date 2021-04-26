
class User < ActiveRecord::Base
  has_secure_password
  has_many :vinyls
  has_many :vinyl_databases

  def slug
    username.downcase.gsub(" ","-")
  end

end