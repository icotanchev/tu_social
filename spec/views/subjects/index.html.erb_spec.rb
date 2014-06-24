require 'spec_helper'

describe "subjects/index" do
  before(:each) do
    assign(:subjects, [
      stub_model(Subject,
        :title => "Title",
        :exam_info => "MyText",
        :subject_info => "MyText",
        :requirements => "MyText",
        :teacher_id => 1
      ),
      stub_model(Subject,
        :title => "Title",
        :exam_info => "MyText",
        :subject_info => "MyText",
        :requirements => "MyText",
        :teacher_id => 1
      )
    ])
  end

  it "renders a list of subjects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
