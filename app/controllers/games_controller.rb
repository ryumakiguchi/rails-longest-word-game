require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def score
    @words = params[:word]
    @available_letters = params[:available_letters]
    if @words.present?
      @letters.each do |letter|
        @full_word = letter.join
      end
      if @full_word.include(@words)
        puts "great"
      end
    end
  end
  def new
    @letters = (0...10).map { (65 + rand(26)).chr }
  end

  def english_word?(keyword)
    answer = URI.open("https://wagon-dictionary.herokuapp.com/#{keyword}")
    json = JSON.parse(answer.read)
    json['found']
  end
end
