require 'rails_helper'

describe 'As a guest' do
  describe 'when I visit `/`' do
    it 'I can log in with GitHub' do
      visit '/'

      click_on "Log In with GitHub"

      expect(page).to have_content("Welcome, Sal Espinosa!")
    end
  end
end
