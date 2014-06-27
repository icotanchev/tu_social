require 'spec_helper'

describe TopicsController do
  include AuthenticationHelper

  before(:each) { login_an_user }
  let(:user) { create(:user) }
  let(:valid_attributes) { { "title" => "MyString", "content" => "Content", "user_id" => user.id } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all topics as @topics" do
      topic = Topic.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:topics)).to eq([topic])
    end
  end

  describe "GET show" do
    it "assigns the requested topic as @topic" do
      topic = Topic.create! valid_attributes
      get :show, {:id => topic.to_param}, valid_session
      expect(assigns(:topic)).to eq(topic)
    end
  end

  describe "GET new" do
    it "assigns a new topic as @topic" do
      get :new, {}, valid_session
      expect(assigns(:topic)).to be_a_new(Topic)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Topic" do
        expect {
          post :create, {:topic => valid_attributes}, valid_session
        }.to change(Topic, :count).by(1)
      end

      it "assigns a newly created topic as @topic" do
        post :create, {:topic => valid_attributes}, valid_session
        expect(assigns(:topic)).to be_a(Topic)
        expect(assigns(:topic)).to be_persisted
      end

      it "redirects to the created topic" do
        post :create, {:topic => valid_attributes}, valid_session
        expect(response).to redirect_to(Topic.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved topic as @topic" do
        Topic.any_instance.stub(:save).and_return(false)
        post :create, {:topic => { "title" => "invalid value" }}, valid_session
        expect(assigns(:topic)).to be_a_new(Topic)
      end

      it "re-renders the 'new' template" do
        Topic.any_instance.stub(:save).and_return(false)
        post :create, {:topic => { "title" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end
end
