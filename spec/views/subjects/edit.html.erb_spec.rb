require 'spec_helper'

describe "subjects/edit" do
  before(:each) do
    @subject = assign(:subject, stub_model(Subject,
      :title => "MyString",
      :exam_info => "MyText",
      :subject_info => "MyText",
      :requirements => "MyText",
      :teacher_id => 1
    ))
  end

  it "renders the edit subject form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", subject_path(@subject), "post" do
      assert_select "input#subject_title[name=?]", "subject[title]"
      assert_select "textarea#subject_exam_info[name=?]", "subject[exam_info]"
      assert_select "textarea#subject_subject_info[name=?]", "subject[subject_info]"
      assert_select "textarea#subject_requirements[name=?]", "subject[requirements]"
      assert_select "input#subject_teacher_id[name=?]", "subject[teacher_id]"
    end
  end
end
