class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include TokenAuthenticatable

  validates :phone_number, uniqueness: true, presence: true
  validates :authentication_token, uniqueness: true, allow_blank: true         
end
