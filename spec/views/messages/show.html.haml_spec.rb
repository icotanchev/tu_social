require 'spec_helper'

describe "messages/show" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :recipient => 1,
      :sender => 2,
      :subject => "Subject",
      :content => "MyText",
      :msg_read => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Subject/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
