require 'rails_helper'

describe "as an user" do
  describe "at the movie show page" do
    before :each do
      @cbs = Studio.create(name: "CBS Studio")
      @nbc = Studio.create(name: "NBC Studio")
      @fox = Studio.create(name: "Fox Studio")
      @indy = Studio.create(name: "Independant Studio")

      @nightmare = @cbs.movies.create!(name: "Nightmare", creation_year: "2019", genre: "Horror")
      @romance_in_the_sun = @nbc.movies.create!(name: "Romance in the Sun", creation_year: "2018", genre: "Romance")
      @dreamscape = @fox.movies.create!(name: "Dreamscape", creation_year: "2020", genre: "Fantasy")
      @in_my_eyes = @indy.movies.create!(name: "In My Eyes", creation_year: "2017", genre: "Documentary")

      @joan = Actor.create!(name: "Joan Waters", age: 22)
      @jim = Actor.create!(name: "Jim Smith", age: 50)
      @jan = Actor.create!(name: "Jan Rogers", age: 29)

      MovieActor.create!(movie: @in_my_eyes, actor: @joan)
      MovieActor.create!(movie: @in_my_eyes, actor: @jan)
      MovieActor.create!(movie: @in_my_eyes, actor: @jim)

    end

    it "can see the actor's name, creation year, and genre. I also see a list its actors in order of age and their average age" do
      visit "/movies/#{@in_my_eyes.id}"

      expect(page).to have_content("#{@in_my_eyes.name}")
      expect(page).to have_content("#{@in_my_eyes.creation_year}")
      expect(page).to have_content("#{@in_my_eyes.genre}")
      expect(page).to have_content("#{@jim.name}")
      expect(page).to have_content("#{@jan.name}")
      expect(page).to have_content("#{@joan.name}")

      expect(page).to have_content(34)

    end
  end
end
