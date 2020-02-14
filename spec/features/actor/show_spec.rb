require 'rails_helper'

describe "as an user" do
  describe "at the actor show page" do
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
      MovieActor.create!(movie: @dreamscape, actor: @joan)
      MovieActor.create!(movie: @nightmare, actor: @joan)

    end

    it "can see the actor's name, age, and a list of movies they've been in" do
      visit "/actors/#{@joan.id}"

      expect(page).to have_content("#{@joan.name}")
      expect(page).to have_content("#{@joan.age}")
      expect(page).to have_content("")
    end
  end
end
