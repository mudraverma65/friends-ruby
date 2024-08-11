class Friend < ApplicationRecord
	belongs_to :user
	validates :first_name, :last_name, :email, :phone, :instagram, :user_id, presence: true
end
