require 'rails_helper'

RSpec.feature "User edits an existing playlist" do
  scenario "they see the updated data for the given playlist " do
    playlist             = create(:playlist_with_songs)
    first, second, third = playlist.songs
    new_song             = create(:song, title: "New Song")


    updated_name = "Skiing"

    visit playlist_path(playlist)
    click_on "Edit"
    fill_in "playlist_name", with: updated_name
    uncheck("song-#{first.id}")
    check("song-#{new_song.id}")
    click_on "Update Playlist"

    expect(page).to have_content updated_name
    expect(page).to_not have_content first.title
    expect(page).to have_content new_song.title
  end
end



# And I enter a new playlist name
# And I select an additional song
# And I uncheck an existing song
# And I click on "Update Playlist"
# Then I should see the playlist's updated name
# And I should see the name of the newly added song
# And I should not see the name of the removed song
