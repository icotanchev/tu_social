require 'spec_helper'

describe "uisses/show" do
  before(:each) do
    @uiss = assign(:uiss, stub_model(Uiss))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
