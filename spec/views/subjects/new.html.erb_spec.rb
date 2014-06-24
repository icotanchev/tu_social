require 'spec_helper'

describe "subjects/new" do
  before(:each) do
    assign(:subject, stub_model(Subject,
      :title => "MyString",
      :exam_info => "MyText",
      :subject_info => "MyText",
      :requirements => "MyText",
      :teacher_id => 1
    ).as_new_record)
  end

  it "renders new subject form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", subjects_path, "post" do
      assert_select "input#subject_title[name=?]", "subject[title]"
      assert_select "textarea#subject_exam_info[name=?]", "subject[exam_info]"
      assert_select "textarea#subject_subject_info[name=?]", "subject[subject_info]"
      assert_select "textarea#subject_requirements[name=?]", "subject[requirements]"
      assert_select "input#subject_teacher_id[name=?]", "subject[teacher_id]"
    end
  end
end
