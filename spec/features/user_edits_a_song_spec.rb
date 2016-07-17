require 'rails_helper'

RSpec.feature "User edits an existing song" do
  scenario "they see the updated data for the song and a link to the artist page" do
    artist = create(:artist)
    song = create(:song)
    updated_title = "Three Little Birds"

    visit song_path(song)
    click_on "Edit"
    fill_in "song_title", with: updated_title
    click_on "Update Song"

    expect(current_path).to eq song_path(song)
    expect(page).to have_content updated_title
    save_and_open_page
    # Then I should see a link to the song artist's individual page
    # expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
