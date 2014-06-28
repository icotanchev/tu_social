module ApplicationHelper
	def select_users_for(selected)
		users = User.all.map { |user| [user.full_name, user.id] }.sort
		options_for_select(users, selected: selected)
	end

	def select_teachers_for(selected)
		users = User.where(role: 'professor').map { |user| [user.full_name, user.id] }.sort
		options_for_select(users, selected: selected)
	end

	def unreaded_msg
		Message.where(recipient: current_user.id, msg_read: nil).count
	end

	def received_mark
		current_user.new_mark
	end

	def datepicker_proper_time(params)
		if params[:q] and params[:q][:created_at_gteq]
			"#{params[:q][:created_at_gteq]} 23:59:59"
		elsif params[:q] and params[:q][:created_at_lteq]
			"#{params[:q][:created_at_lteq]} 00:00:00"
		else
			''
		end
	end
end
