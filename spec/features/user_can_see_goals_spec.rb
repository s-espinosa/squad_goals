require 'rails_helper'

describe "When I visit '/goals'" do
  it "I can see a collection of goals" do
    goal1 = Goal.create(focus_area: 0, level: 0, description: "Speak at a conference")
    goal2 = Goal.create(focus_area: 1, level: 1, description: "Speak at a big conference")
    goal3 = Goal.create(focus_area: 3, level: 2, description: "Learn Haskell")

    visit '/goals'

    expect(page).to have_content("Speak at a conference")
    expect(page).to have_content("Learn Haskell")
    expect(page).to have_content("Individual")
    expect(page).to have_content("Professional/Leadership")
    expect(page).to have_content("Expected")
    expect(page).to have_content("Possible")
    expect(page).to have_content("Reach")
  end
end
