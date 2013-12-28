require 'spec_helper'

describe "uisses/index" do
  before(:each) do
    assign(:uisses, [
      stub_model(Uiss),
      stub_model(Uiss)
    ])
  end

  it "renders a list of uisses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
