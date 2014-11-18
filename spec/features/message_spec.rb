require 'rails_helper'

feature 'Create Message' do
  let!(:user) { FactoryGirl.create(:user) }

  context 'when logged in' do
    it 'redirects' do
      sign_in user
      visit new_user_message_path
      fill_in 'Context', with: "I'm Batman!"
      click_button 'Create Message'
      expect(page).to have_text("Message was successfully created.")
    end
  end
end
