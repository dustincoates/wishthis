require 'spec_helper'
feature "Items" do
  scenario "add_item" do
    visit popup_add_path
    fill_in "username", :with => "admin"
    fill_in "password", :with => "ohHiThere"
    click_button "Login"
    page.should have_content "Add a note"
  end
end