class User < ActiveRecord::Base
  attr_accessible :email, :name

  validates :email, uniqueness: true
end
