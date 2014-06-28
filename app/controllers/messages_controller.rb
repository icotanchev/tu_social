class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :destroy]

  def index
    @messages = Message.where(sender: current_user.id).page(params[:page])
  end

  def received
    @messages = Message.where(recipient: current_user.id).page(params[:page])
    
    render :index
  end

  def mark_all_as_readed
    Message.where(recipient: current_user.id).each do |msg|
      msg.msg_read = true
      msg.save!
    end

    redirect_to received_messages_url
  end

  def show
    @message.msg_read = true
    @message.save!
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    @message.sender = current_user.id 
    @message.recipient = params[:recipient]
    if @message.save
      recipient = User.find(params[:recipient])
      redirect_to messages_url, notice: 'Message was successfully send!'
      send_email(recipient) if recipient.send_emails
    else
      render action: 'new'
    end
  end

  def destroy
    @message.destroy

    redirect_to messages_url
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
