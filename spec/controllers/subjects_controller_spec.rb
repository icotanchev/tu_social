require 'spec_helper'

describe SubjectsController do
include AuthenticationHelper
  
  describe 'GET #index' do

    before(:each) { login_an_user }

    it 'renders the :index template' do
      get :index

      expect(response).to be_success
      expect(response).to render_template :index
    end

    it 'initializes @subjects' do
      subjects = double(Subject).as_null_object
      Subject.stub(:search) { subjects }

      get :index

      expect(assigns(:subjects)).to eq(subjects)
    end
  end

  describe 'student accounts can not manage subjects' do
    before(:each) { login_an_user }

    describe 'GET #new' do
      it 'redirects to root' do
        get :new

        expect(response).to redirect_to root_url
      end
    end

    describe 'POST #create' do
      it 'redirects to root' do
        expect {
          post :create, { "subject"=>{"title"=>"new", "exam_info"=>"info", "subject_info"=>"info", "requirements"=>"info"} }
        }.to_not change(Subject, :count)

        expect(response).to redirect_to root_url
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to root' do
        subject = create(:subject)
        expect{ delete :destroy, id: subject.id }.to_not change(Subject, :count)

        redirect_to root_url
      end
    end
  end

  describe 'professor accounts can manage subjects' do

    before(:each) { login_an_professor }

    describe 'GET #new' do
      it 'renders the :new template' do
        get :new

        expect(response).to render_template :new
      end

      it 'makes new message' do
        Subject.should_receive(:new).twice

        get :new

        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      it 'creates new subject' do
        expect {
          post :create, { "subject"=>{"title"=>"new", "exam_info"=>"info", "subject_info"=>"info", "requirements"=>"info"} }
        }.to change(Subject, :count).by(1)
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes message' do
        subject = create(:subject)
        expect{ delete :destroy, id: subject.id }.to change(Subject, :count).by(-1)

        redirect_to subjects_url
      end
    end
  end
end
