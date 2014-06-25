class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
  end

  def sent
    @messages = Message.where(sender: current_user.id)
    render :index
  end

  def received
    @messages = Message.where(recipient: current_user.id)
    render :index
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    @message.sender, @message.recipient, @message.msg_read = current_user.id, params[:recipient], false
    if @message.save
      redirect_to @message, notice: 'Message was successfully send!'
    else
      render action: 'new'
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:recipient, :sender, :subject, :content, :msg_read)
    end
end