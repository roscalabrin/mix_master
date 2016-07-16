require 'rails_helper'

RSpec.feature "User views a list of all artists" do
  scenario "they see the page with all artists's names" do
    %w(Bob Adele Beyonce).each do |artist_name|
      Artist.create(name: artist_name, image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    end

    visit artists_path

    Artist.all.each do |artist|
      expect(page).to have_link artist.name, href: artist_path(artist)
    end
  end
end
