require 'spec_helper'

describe "marks/new" do
  before(:each) do
    assign(:mark, stub_model(Mark,
      :marks => "MyText",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new mark form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", marks_path, "post" do
      assert_select "textarea#mark_marks[name=?]", "mark[marks]"
      assert_select "input#mark_user_id[name=?]", "mark[user_id]"
    end
  end
end
