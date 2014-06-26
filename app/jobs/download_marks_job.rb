class DownloadMarksJob

	@queue = :update_marks

	def self.perform(id)
		UissMarks::MarksConfigurator.new(id).configure_marks
	end
end