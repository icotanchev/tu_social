class Mark < ActiveRecord::Base
	belongs_to :user

	serialize :marks
end
