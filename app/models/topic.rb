class Topic < ActiveRecord::Base
	has_many :comments, as: :commentable

	belongs_to :user

	validates :user, presence: true
end
