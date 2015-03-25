require 'rails_helper'

feature 'Registrations' do
  scenario "User can sign up" do
    visit sign_up_path
    fill_in "First name", with: "Pam"
    fill_in "Last name", with: "Adams"
    fill_in "Email", with: 'bam@pow.com'
    fill_in "Password", with: "password"
    click_on "Create User"

  end
end
