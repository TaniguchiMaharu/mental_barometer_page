class User < ApplicationRecord
  has_many :posts # ひとりのユーザーに複数のPostが紐づけられる
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, length: {maximum: 20}
end
