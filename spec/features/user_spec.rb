require 'rails_helper'

feature 'Create User' do
  context 'when employee_id and email are valid' do
    it 'redirects' do
      visit new_user_path
      fill_in 'Employee ID', with: '100351'
      fill_in 'Email', with: 'mj.ismydawg@example.com'
      click_button 'Create User'
      expect(page).to have_text("User was successfully created.")
    end
  end

  context 'when email is not valid' do
    it 'renders' do
      visit new_user_path
      fill_in 'Employee ID', with: '100351'
      fill_in 'Email', with: 'dfghjk'
      click_button 'Create User'
      expect(page).to_not have_text("User was successfully created.")
      expect(page).to have_text("Please fill in all fields with valid text.")
    end
  end

  context 'when employee_id is not valid' do
    it 'renders' do
      visit new_user_path
      fill_in 'Employee ID', with: '12345'
      fill_in 'Email', with: 'bob.dylan@example.com'
      click_button 'Create User'
      expect(page).to_not have_text("User was successfully created.")
      expect(page).to have_text("Please fill in all fields with valid text.")
    end
  end

end
