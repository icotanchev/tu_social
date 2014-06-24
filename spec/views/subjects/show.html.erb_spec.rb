require 'spec_helper'

describe "subjects/show" do
  before(:each) do
    @subject = assign(:subject, stub_model(Subject,
      :title => "Title",
      :exam_info => "MyText",
      :subject_info => "MyText",
      :requirements => "MyText",
      :teacher_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
