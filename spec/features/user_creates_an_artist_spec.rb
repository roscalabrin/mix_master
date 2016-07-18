require 'rails_helper'

RSpec.feature "User submits a new artist" do
  scenario "they see the page for the individual artist" do
    artist_name       = "Bob Marley"
    # fixture_image_path = Rails.root.join('spec', 'support', 'bob_marley.jpg')
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit artists_path
    click_on "New artist"
    fill_in "artist_name", with: artist_name
    # attach_file 'Image', fixture_image_path
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect(page).to have_content artist_name
    # expect(page).to have_css("img[src=\"#{bob_marley.jpg}\"]")
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end

  context "the submitted data is invalid" do
    scenario "they see an error message" do
      artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

      visit artists_path
      click_on "New artist"
      fill_in "artist_image_path", with: artist_image_path
      click_on "Create Artist"

      expect(page).to have_content "Name can't be blank"
    end
  end
end
