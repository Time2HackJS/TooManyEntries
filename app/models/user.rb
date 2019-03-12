class User < ApplicationRecord
  validates_uniqueness_of :name
  validates_length_of :name, minimum: 3
  validates_length_of :password, minimum: 3


  def authenticate(taken_pass)
    password == taken_pass
  end

  def admin?
    admin
  end
end
