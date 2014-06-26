module UissMarks
	class MarksConfigurator

		def initialize(user_id)
			@user_id = user_id
		end

		def configure_marks
			fetched_marks = Fetcher.new(user.pin, user.faculty_number).fetch!

			update_marks(fetched_marks) unless fetched_marks == user.mark.marks
		end
		
		private

		def update_marks(marks)
			Mark.where(user_id: user.id).first.update_attribute(:marks, marks)
			user.update_attribute(:new_mark, true)
		end

		def user
			@user ||= User.find(@user_id)
		end
	end
end