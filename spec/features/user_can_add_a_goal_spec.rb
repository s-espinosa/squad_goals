require 'rails_helper'

describe 'As a logged in user' do
  describe 'when I visit my goals page' do
    it 'I can add a goal' do
      user = User.create(uid: "1234", nickname: "s-espinosa", name: "Sal Espinosa", token: "123456")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/goals'
      click_on "Create New Goal"
      fill_in "goal[description]", with: "Speak at a conference"
      select "Expected", from: "goal[level]"
      select "Community", from: "goal[focus_area]"

      click_on "Create Goal"
      expect(page).to have_content("Speak at a conference")
    end
  end
end
