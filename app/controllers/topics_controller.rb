class TopicsController < ApplicationController
  before_action :set_topic, only: [:show]

  def index
    @search = Topic.search(params[:q])
    @topics = @search.result.includes(:user).page(params[:page])
  end

  def show
    @topic = Topic.find(params[:id])
    @commentable = @topic
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    @topic.user = current_user
    if @topic.save
      redirect_to @topic, notice: 'Topic was successfully created.'
    else
      render action: 'new', warning: 'Topic was not created!'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :content, :user_id)
    end
end
