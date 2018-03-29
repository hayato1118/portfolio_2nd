class Contact < ApplicationRecord
	validates :email, presence: true
	validates :body, presence: true
	validates :title, presence: true
end
