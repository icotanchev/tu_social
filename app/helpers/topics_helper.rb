module TopicsHelper

	def topic_owner(id)
		User.find(id).full_name
	end
end
