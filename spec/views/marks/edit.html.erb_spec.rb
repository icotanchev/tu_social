require 'spec_helper'

describe "marks/edit" do
  before(:each) do
    @mark = assign(:mark, stub_model(Mark,
      :marks => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit mark form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mark_path(@mark), "post" do
      assert_select "textarea#mark_marks[name=?]", "mark[marks]"
      assert_select "input#mark_user_id[name=?]", "mark[user_id]"
    end
  end
end
