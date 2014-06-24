class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @subjects = Subject.all
  end

  def show
  end

  def new
    @subject = Subject.new
  end

  def edit
  end

  def create
    @subject = Subject.new(subject_params)
    
    @subject.user = current_user
    if @subject.save and current_user.professor?
      redirect_to @subject, notice: 'Subject was successfully created.' 
    else
      render action: 'new', warning: 'Subject was not created!' 
    end
  end

  def update
    if @subject.update(subject_params) and current_user.professor?
      redirect_to @subject, notice: 'Subject was successfully updated.'
    else
      render action: 'edit', notice: 'Subject was successfully updated.'
    end
  end

  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:title, :exam_info, :subject_info, :requirements, :teacher_id)
    end
end
