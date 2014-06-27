require 'spec_helper'

describe MessagesController do

  include AuthenticationHelper
  
  before(:each) { login_an_user }
  
  describe 'GET #index' do
    it 'renders the :index template' do
      get :index

      expect(response).to be_success
      expect(response).to render_template :index
    end

    it 'initializes @messages' do
      messages = double(Message).as_null_object
      Message.stub(:where) { messages }

      get :index

      expect(assigns(:messages)).to eq(messages)
    end
  end

  describe 'GET #received' do
    it 'renders the :index template' do
      get :received

      expect(response).to be_success
      expect(response).to render_template :index
    end

    it 'initializes @messages' do
      messages = double(Message).as_null_object
      Message.stub(:where) { messages }

      get :received

      expect(assigns(:messages)).to eq(messages)
    end
  end

  describe 'GET #mark_all_as_readed' do
    it 'redirects to root_url' do
      get :mark_all_as_readed

      expect(response).to redirect_to received_messages_url
    end

    it 'updates messages read status' do
      messages = double(Message).as_null_object
      message = double(Message).as_null_object
      Message.should_receive(:where) { messages }
      messages.should_receive(:each) { message }

      get :mark_all_as_readed
    end
  end

  describe 'GET #new' do
    it 'renders the :new template' do
      get :new

      expect(response).to render_template :new
    end

    it 'makes new message' do
      Message.should_receive(:new)

      get :new
    end
  end

  describe 'POST #create' do
    it 'creates new message' do
      user = create(:user)
      expect {
        post :create, { "message"=>{"subject"=>"qweqwe", "content"=>"qweqweq"}, 'recipient' => user.id}
      }.to change(Message, :count).by(1)

      expect(flash[:notice]).to be_present
    end

    it 'creates new message' do
      Message.stub(:save!) { false }

      post :create, { "message"=>{"subject"=>"qweqwe", "content"=>"qweqweq"} }

      expect(response).to render_template :new
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes message' do
      msg = create(:message)
      expect { delete :destroy, id: msg.id }.to change(Message, :count).by(-1)

      redirect_to messages_url
    end
  end
end
