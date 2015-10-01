class User < ActiveRecord::Base
  validates :username, :presence => { :messages => "Username cannot be blank." }
  validates :username, :uniqueness => { :messages => "Username is already taken."}
  validates :username, :length => { :minimum => 5, :maximum => 20, :too_short =>"Your name must be at least 5 characters long.", :too_long => "Your name must be at most 20 characters long." }
  validates :password, :length => { :minimum => 8, :maximum => 20, :too_short =>"Your password must be at least 8 characters long.", :too_long => "Your password must be at most 20 characters long." }
end
