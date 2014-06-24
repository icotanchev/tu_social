module SubjectsHelper

	def subject_owner(id)
		User.find(id).full_name
	end
end
