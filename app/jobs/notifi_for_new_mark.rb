class NotifiForNewMark
	@queue = :new_mark

	def self.perform
		User.where(new_mark: true).each do |user|
			UserNotifier.new_message(user)
			user.update_attribute(:new_mark, true)
		end
	end
end