require 'spec_helper'
describe MarksController do
  include AuthenticationHelper
  
  before(:each) { login_an_user }
  
  describe 'GET #index' do
    it 'renders the :index template' do
      get :index

      expect(response).to be_success
      expect(response).to render_template :index
    end

    it 'creates @marks when does not exist' do
      mark = double(Mark).as_null_object
      Mark.should_receive(:where) { mark }
      mark.should_receive(:first) { nil }
      Mark.should_receive(:create!)

      get :index
    end

    it 'returns @marks when exist' do
      mark = double(Mark).as_null_object
      Mark.stub(:where) { mark }
      Mark.should_not_receive(:create!)

      get :index
    end
  end

  describe 'GET #new_mark' do
    it 'redirects to root url' do
      get :new_mark

      expect(flash[:notice]).to be_present
      expect(response).to redirect_to edit_user_path(User.last.id)
    end

    it 'enqueues background job' do
      # Resque.should_receive(:enqueue)
      # get :new_mark
    end
  end
end
