require 'rails_helper'

describe "as an user" do
  describe "at the studio index" do
    before :each do
      @cbs = Studio.create(name: "CBS Studio")
      @nbc = Studio.create(name: "NBC Studio")
      @fox = Studio.create(name: "Fox Studio")
      @indy = Studio.create(name: "Independant Studio")



      @nightmare = @cbs.movies.create!(name: "Nightmare", creation_year: "2019", genre: "Horror")
      @romance_in_the_sun = @nbc.movies.create!(name: "Romance in the Sun", creation_year: "2018", genre: "Romance")
      @dreamscape = @fox.movies.create!(name: "Dreamscape", creation_year: "2020", genre: "Fantasy")
      @in_my_eyes = @indy.movies.create!(name: "In My Eyes", creation_year: "2017", genre: "Documentary")



    end

    it "shows a list of all the movie studios and it's movies" do
      visit "/studios"

      expect(page).to have_content("Studio Index")



    end
  end
end
