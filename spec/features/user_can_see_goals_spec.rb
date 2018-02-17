require 'rails_helper'

describe "When I visit '/goals'" do
  describe "as a logged in user" do
    it "I can see a collection of goals" do
      user = User.create(uid: "12", nickname: "s-espinosa", name: "Sal Espinosa", token: "12345")
      user.goals.create(focus_area: 0, level: 0, description: "Speak at a conference")
      user.goals.create(focus_area: 1, level: 1, description: "Speak at a big conference")
      user.goals.create(focus_area: 3, level: 2, description: "Learn Haskell")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit goals_path

      expect(page).to have_content("Speak at a conference")
      expect(page).to have_content("Learn Haskell")
      expect(page).to have_content("Individual")
      expect(page).to have_content("Professional/Leadership")
      expect(page).to have_content("Expected")
      expect(page).to have_content("Possible")
      expect(page).to have_content("Reach")
    end

    it "I cannot see another users goals" do
      user = User.create(uid: "12", nickname: "s-espinosa", name: "Sal Espinosa", token: "12345")
      user.goals.create(focus_area: 0, level: 0, description: "Speak at a conference")
      user.goals.create(focus_area: 1, level: 1, description: "Speak at a big conference")
      user.goals.create(focus_area: 3, level: 2, description: "Learn Haskell")
      user2 = User.create(uid: "34", nickname: "other", name: "Other Other", token: "67890")
      user2.goals.create(focus_area: 3, level: 2, description: "Type faster")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit goals_path

      expect(page).to have_content("Speak at a conference")
      expect(page).to have_content("Learn Haskell")
      expect(page).to have_content("Individual")
      expect(page).to have_content("Professional/Leadership")
      expect(page).to have_content("Expected")
      expect(page).to have_content("Possible")
      expect(page).to have_content("Reach")
      expect(page).to_not have_content("Type faster")
    end
  end
end
