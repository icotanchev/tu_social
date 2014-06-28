class MarksController < ApplicationController
  def index
    mark = Mark.where(user_id: current_user.id).first

  	if current_user.new_mark
      current_user.new_mark = false
      current_user.save!
    end
  	if mark.nil?
  		@marks = Mark.create!(user_id: current_user.id)
    elsif mark.marks == 'Error: can not download marks'
      mark.marks = nil
      mark.save!
  	else
    	@marks = mark.marks
    end
  end

  def new_mark
    if current_user.pin and current_user.faculty_number
      UissMarks::MarksConfigurator.new(current_user.id).configure_marks
      redirect_to root_url, notice: 'Mark has been scheduled for download !'
    else
      redirect_to edit_user_path(current_user.id), notice: "Configure your 'PIN' and 'Faculty number' to download marks !"
    end
  end
end
