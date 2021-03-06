require "rails_helper"
require "spec_helper"

feature "Posting" do
  given(:user) { create(:user) }
  given(:status_text) { "Whohoo!" }

  def sign_in(user)
    
    binding.pry
    
    visit new_user_session_path
    fill_in "Username / Email", with: user.username
    fill_in "Password",	with: user.password 
    click_on "Log in"
  end
  
  scenario "Posting a status" do
    sign_in user

    expect{
      fill_in "post_status_text",	with: status_text
      click_on "Say"
    }.to change { user.reload.post.count }.from(0).to(1)

    posted_status = user.post.first.postable
    expect(posted_status.text).to eq status_text
    expect(page).to have_content status_text

    within(".line .content") do
      expect(page).not_to have_selector("img")
    end
  end

end