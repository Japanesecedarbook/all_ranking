class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
     
  has_many :rankings
  has_many :likes, dependent: :destroy
  has_many :comments
  
  validates :name, presence: true, uniqueness: true
end
