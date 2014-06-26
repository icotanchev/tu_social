module ApplicationHelper
	def select_users_for(selected)
		users = User.all.map { |user| [user.full_name, user.id] }.sort
		options_for_select(users, selected: selected)
	end
end
