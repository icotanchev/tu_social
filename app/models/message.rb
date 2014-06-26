class Message < ActiveRecord::Base
	belongs_to :user

	validates :sender, presence: true
	validates :recipient, presence: true
	validates :subject, presence: true
	validates :content, presence: true
end
