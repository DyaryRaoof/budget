require 'rails_helper'

RSpec.describe 'Login page', type: :system do
  describe 'login page' do
    before(:each) do
      User.create(name: 'Dyary', email: 'dyary2020@gmail.com', password: '123456', password_confirmation: '123456')
      visit new_user_session_path
    end
    it 'Can see the email input' do
      expect(page).to have_field('Email')
    end

    it 'Can see the password input' do
      expect(page).to have_field('Password')
    end

    it 'Can see the submit button' do
      expect(page).to have_button('Log In')
    end

    it 'When I click the submit button without filling in the username and the password,
    I get a detailed error.' do
      find('input[name="commit"]').click
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'When I click the submit button after filling in the username and the password with incorrect data,
    I get a detailed error.' do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      find('input[name="commit"]').click
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'When I click the submit button after filling in the username and the password with correct data,
    I am redirected to the root page.' do
      fill_in 'Email', with: 'dyary2020@gmail.com'
      fill_in 'Password', with: '123456'
      find('input[name="commit"]').click
      expect(page).to have_current_path(groups_path)
    end
  end
end
