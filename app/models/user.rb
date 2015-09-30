class User < ActiveRecord::Base
  validates :username, :presence => { :messages => "Username cannot be blank." }
  validates :username, :uniqueness => { :messages => "Username is already taken."}
  validates :username, :length => { :minimum => 5, :maximum => 20 }
  validates :password, :length => { :minimum => 8, :maximum => 20 }
end
