require 'spec_helper'

describe "uisses/new" do
  before(:each) do
    assign(:uiss, stub_model(Uiss).as_new_record)
  end

  it "renders new uiss form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", uisses_path, "post" do
    end
  end
end
