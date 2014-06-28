require 'spec_helper'

describe UsersController do
	include AuthenticationHelper
  
  before(:each) { login_an_user }

  describe 'GET #index' do

    it 'renders the :index template' do
      get :index

      expect(response).to be_success
      expect(response).to render_template :index
    end

    it 'initializes @users' do
      users = double(User).as_null_object
      User.stub(:search) { users }

      get :index

      expect(assigns(:users)).to eq(users)
    end
  end

  describe 'GET #teachers' do

    it 'renders the :index template' do
      get :teachers

      expect(response).to be_success
      expect(response).to render_template :index
    end

    it 'initializes @teachers' do
      users = double(User).as_null_object
      User.stub(:search) { users }

      get :index

      expect(assigns(:users)).to eq(users)
    end
  end
end
