class UserNotifier < ActionMailer::Base

	def new_message(user)
		@user = user
		@message = Message.where(recipient: @user.id).last
		@sender = User.find(@message.sender)

		mail(
			from: 'icotnachev91@gmail.com', 
			reply_to: 'icotnachev91@gmail.com',
      to: user.email,
      subject: 'tu-social you have new message'
    ).deliver
	end

	def new_mark(user)
		@user = user

		mail(
			from: 'icotnachev91@gmail.com', 
			reply_to: 'icotnachev91@gmail.com',
      to: user.email,
      subject: 'tu-social you have new message'
    ).deliver
	end
end