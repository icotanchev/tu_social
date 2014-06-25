class Topic < ActiveRecord::Base
	validates :user, presence: true
	has_many :comments, as: :commentable

	belongs_to :user
end
