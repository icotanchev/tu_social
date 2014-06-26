class MarksController < ApplicationController
  def index
    @marks = Mark.where(user_id: current_user.id).first.marks
  end

  def new_mark
    Resque.enqueue(DownloadMarksJob, current_user.id)

    redirect_to root_url, notice: 'Mark has been scheduled for download !'
  end
end
