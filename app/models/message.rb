class Message < ActiveRecord::Base
	belongs_to :user

	validates :user, presence: true
	validates :subject, presence: true
	validates :content, presence: true, uniqueness: true
end
