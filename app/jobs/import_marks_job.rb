class ImportMarksJob
	@queue = :import_marks

	def self.perform
		User.where(role: 'student').each do |user|
			UissMarks::MarksConfigurator.new(user.id).configure_marks
		end
	end
end