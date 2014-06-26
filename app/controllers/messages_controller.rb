class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :destroy]

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
    
    @message.sender = current_user.id 
    @message.recipient = params[:recipient] 
    @message.msg_read = false
    if @message.save
      recipient = User.find(params[:recipient])
      redirect_to @message, notice: 'Message was successfully send!'
      send_email(recipient) if recipient.send_emails
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
    #sending emails
    def send_email(user)
      UserNotifier.new_message(user)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:recipient, :sender, :subject, :content, :msg_read)
    end
end
