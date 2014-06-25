class Subject < ActiveRecord::Base
	belongs_to :user
	has_many :comments, as: :commentable

	validates :user, presence: true
	validates :title, presence: true, uniqueness: true
	
	validate :presence_of_one_more_param

	private

	def presence_of_one_more_param
		if self.exam_info.blank? and self.subject_info.blank? and self.requirements.blank?
			errors.add(:base, 'At least one more parameter must be added!')
		end
	end
end
