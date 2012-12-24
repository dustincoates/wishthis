require 'spec_helper'
feature "Users" do
  scenario "show user page" do
    visit user_path("admin")
    page.should have_content "admin's Wishlist"
  end

  scenario "login" do
    visit user_path("admin")
    click_link "Login"
    page.should have_content "Don't have an account?"
  end

  scenario "sign up" do
    visit user_path("admin")
    click_link "Sign Up"
    page.should have_content "Password Confirmation:"
  end

  scenario "create user" do
    visit new_user_path
    fill_in "Username", :with => "testuser"
    fill_in "user_first_name", :with => "testuser"
    fill_in "user_password", :with => "12345"
    fill_in "user_password_confirmation", :with => "12345"
    fill_in "Email", :with => "dustin@dcoates.com"
    click_button "Go"
    page.should have_content "testuser"
  end

  scenario "fail user" do
    visit new_user_path
    fill_in "Username", :with => "testuser"
    fill_in "user_first_name", :with => "testuser"
    fill_in "user_password", :with => "12345"
    fill_in "user_password_confirmation", :with => "123455"
    fill_in "Email", :with => "dustin@dcoates.com"
    click_button "Go"
    page.should have_content "Password doesn't match"
  end
end