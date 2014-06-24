require 'spec_helper'

describe "topics/edit" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :title => "MyString",
      :content => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", topic_path(@topic), "post" do
      assert_select "input#topic_title[name=?]", "topic[title]"
      assert_select "textarea#topic_content[name=?]", "topic[content]"
      assert_select "input#topic_user_id[name=?]", "topic[user_id]"
    end
  end
end
