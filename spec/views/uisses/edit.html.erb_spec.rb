require 'spec_helper'

describe "uisses/edit" do
  before(:each) do
    @uiss = assign(:uiss, stub_model(Uiss))
  end

  it "renders the edit uiss form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", uiss_path(@uiss), "post" do
    end
  end
end
