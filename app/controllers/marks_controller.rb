class MarksController < ApplicationController
  def index
    mark = Mark.where(user_id: current_user.id).first

  	if current_user.new_mark
      current_user.new_mark = false
      current_user.save!
    end
  	if mark.nil?
  		@marks = Mark.create!(user_id: current_user.id)
  	else
    	@marks = mark.marks
    end
  end

  def new_mark
    Resque.enqueue(DownloadMarksJob, current_user.id)

    redirect_to root_url, notice: 'Mark has been scheduled for download !'
  end
end
