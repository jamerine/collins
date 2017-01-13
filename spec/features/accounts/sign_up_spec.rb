require "rails_helper"
  feature "Accounts" do
    scenario "creating an account" do
        visit root_path
        click_link "Sign Up"
        fill_in "Business name", with: "Test"
        fill_in "First name", with: "First"
        fill_in "Last name", with: "Last"
        fill_in "Email", with: "test@example.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Create Account"
    within(".flash") do
      success_message = "Your account has been created."
      expect(page).to have_content(success_message)
    end
  end
end
