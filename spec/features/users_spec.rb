require 'rails_helper'

feature 'Users' do

  before :each do
    User.create(email: 'spartacus@email.com', password: 'gladiator')
  end

  scenario 'Users can sign up' do
    visit root_path
    expect(page).to have_no_content('Sign Out')
    click_on 'Sign Up'
    fill_in 'Email', with: 'sleepyhollow@email.com'
    fill_in 'Password', with: 'icrane@email.com'
    fill_in 'Password confirmation', with: 'icrane@email.com'
    click_on 'Sign Up'

    expect(page).to have_content('You have successfully signed up!')
    expect(page).to have_content('The logged in user is: sleepyhollow@email.com')
    expect(page).to have_content('Sign Out')
    expect(page).to have_no_content('Sign In')
    expect(page).to have_no_content('Sign Up')
  end

  scenario 'Users can sign in and sign out' do
    visit root_path
    expect(page).to have_no_content('Sign Out')
    click_on 'Sign In'
    fill_in 'Email', with: 'spartacus@email.com'
    fill_in 'Password', with: 'gladiator'
    click_on 'Sign In'

    expect(page).to have_content('Welcome, you are now signed in!')
    expect(page).to have_content('The logged in user is: spartacus@email.com')
    expect(page).to have_content('Sign Out')
    expect(page).to have_no_content('Sign In')

    click_on 'Sign Out'
    expect(page).to have_content('You are now signed out!')
    expect(page).to have_no_content('Sign Out')
    expect(page).to have_no_content('The logged in user is: spartacus@email.com')
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Up')
  end



end
