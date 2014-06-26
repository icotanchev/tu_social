class SendMsgToUsers
	@queue = :send_emails

	def self.perform
		Message.where(msg_read: false).each do |msg|
			user = User.find(msg.recipient)
			UserNotifier.new_message(user)
			msg.update_attribute(:msg_read, true)
		end
	end
end