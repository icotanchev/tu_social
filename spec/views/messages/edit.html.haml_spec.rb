require 'spec_helper'

describe "messages/edit" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :recipient => 1,
      :sender => 1,
      :subject => "MyString",
      :content => "MyText",
      :msg_read => false
    ))
  end

  it "renders the edit message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", message_path(@message), "post" do
      assert_select "input#message_recipient[name=?]", "message[recipient]"
      assert_select "input#message_sender[name=?]", "message[sender]"
      assert_select "input#message_subject[name=?]", "message[subject]"
      assert_select "textarea#message_content[name=?]", "message[content]"
      assert_select "input#message_msg_read[name=?]", "message[msg_read]"
    end
  end
end
