require 'rails_helper'

describe "the signup process" do
  it "creates a new user" do
    visit '/signup'
    fill_in 'Name', :with => 'Mr.Rogers'
    fill_in 'Email', :with => 'rogers@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign Up'
    page.should have_content 'Thank you'
  end

  it "gives a user an error who uses a non-unique email" do
    visit '/signup'
    user = User.create(:name => 'Will Rogers', :email => 'rogers@example.com', :password => 'password')
    fill_in 'Name', :with => 'Mr.Rogers'
    fill_in 'Email', :with => 'rogers@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign Up'
    page.should have_content 'taken'
  end
end
