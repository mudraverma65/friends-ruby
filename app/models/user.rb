class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :friends

	validates :password, length: { minimum: 8 }, if: -> { new_record? || !password.nil? }
  	validates :password, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}\z/, message: "must include at least one uppercase letter, one lowercase letter, one digit, and one special character" }
end
