module ApplicationHelper
	def select_users_for(selected)
		users = User.all.map { |user| [user.full_name, user.id] }.sort
		options_for_select(users, selected: selected)
	end

	def unreaded_msg
		Message.where(recipient: current_user.id, msg_read: nil).count
	end

	def received_mark
		current_user.new_mark
	end
end
