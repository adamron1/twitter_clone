class User < ActiveRecord::Base
  validates :user_name, length: {minimum: 4, maximum: 30}
  validates :user_name, uniqueness: true
  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

end
