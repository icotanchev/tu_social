require 'spec_helper'

describe 'Topics' do
    include AuthenticationHelper

  before(:all) { generates_topics }

  before(:each) do  
    visit_protected root_path
  end

  it 'list topics' do
    expect(page).to have_text 'Topics'
    expect(page).to have_link 'Title'
    expect(page).to have_link 'Content'
    expect(page).to have_link 'Created at'
    expect(page).to have_text 'User name'

    Topic.all.each do |topic|
      expectations(topic)
    end
  end

  context 'search topics' do
    before(:each) { @topic = Topic.last }
    it 'can search by title' do
      fill_in 'q_title_cont', with: @topic.title
      click_button 'Search'

      expectations(@topic)
    end

    it 'can search by Topic content' do
      fill_in 'q_content_cont', with: @topic.content
      click_button 'Search'

      expectations(@topic)
    end

    it 'can search by user name' do
      user = User.last
      @topic.user_id = user.id
      @topic.save!

      select user.full_name, from: 'q_user_id_eq'
      click_button 'Search'

      expectations(@topic)
    end
  end

  it 'can create new topic' do
    click_link 'New Topic'

    expect(current_path).to eq new_topic_path
    expect(page).to have_text 'New topic'

    fill_in 'topic_title', with: 'New topic'
    fill_in 'topic_content', with: 'New topic content'

    click_button 'Create topic'

    expect(current_path).to eq topic_path(Topic.last.id)

    expect(page).to have_text 'New topic'
    expect(page).to have_text 'New topic content'
    expect(page).to have_text 'Topic was successfully created.'
  end

  context 'comment' do
    it 'can add comments to topic' do
      sub = Topic.first
      click_link "view_topic_#{sub.id}"

      expect(current_path).to eq topic_path(sub.id)     

      expect(page).to have_text 'Comments'

      fill_in 'comment_content', with: 'Test Comment'
      click_button 'Create comment'

      expect(current_path).to eq topic_path(sub.id)
      expect(page).to have_text 'Test Comment'
    end
  end

  private

  def generates_topics
    5.times { create(:topic, content: 'Cont') }
  end

  def expectations(topic)
    expect(page).to have_text topic.title
    expect(page).to have_text topic.content
  end
end