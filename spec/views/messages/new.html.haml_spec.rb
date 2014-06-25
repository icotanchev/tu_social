require 'spec_helper'

describe "messages/new" do
  before(:each) do
    assign(:message, stub_model(Message,
      :recipient => 1,
      :sender => 1,
      :subject => "MyString",
      :content => "MyText",
      :msg_read => false
    ).as_new_record)
  end

  it "renders new message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", messages_path, "post" do
      assert_select "input#message_recipient[name=?]", "message[recipient]"
      assert_select "input#message_sender[name=?]", "message[sender]"
      assert_select "input#message_subject[name=?]", "message[subject]"
      assert_select "textarea#message_content[name=?]", "message[content]"
      assert_select "input#message_msg_read[name=?]", "message[msg_read]"
    end
  end
end
