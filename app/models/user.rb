class User < ActiveRecord::Base
  validates :username, :uniqueness => true
  validates :username, :presence => true
  validates :username, :length => { :minimum => 5, :maximum => 20 }
  validates :password, :length => { :minimum => 8, :maximum => 20 }
end
