class CommentsController < ApplicationController
  before_filter :load_commentable

  def index
  	@comments = @commentable.comments
  end

  def new
  	@comment = @commentable.comments.new
  end

  def create
  	@comment = @commentable.comments.new(subject_params)
  	if @comment.save
  		redirect_to @commentable, notice: 'Comment was successfully created.' 
  	else
  		render :new, warning: 'Comment was not created!' 
  	end
  end

  private

  def load_commentable
  	objects = [Topic, Subject].detect { |obj| params["#{obj.name.underscore}_id"] }
  	@commentable = objects.find(params["#{objects.name.underscore}_id"])
  end

  def subject_params
    params.require(:comment).permit(:content)
  end
end
