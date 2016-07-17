require 'rails_helper'

RSpec.feature "User view a list of all playlists" do
  scenario "they see a page with links to all playlists' pages" do
     playlists = []
     2.times do
      playlists << create(:playlist)
    end

    visit playlists_path

    playlists.each do |playlist|
      expect(page).to have_link playlist.name, href: playlist_path(playlist)
    end
  end
end
