#!/usr/bin/env ruby
require 'pry'


#This method works, creating hash of most common words with number they appear

def create_word_table
  dictionary = Hash.new(0)
  number = 10
  File.read("lotsowords.txt").scan(/\w+/).each do |word|
    word.downcase!
    dictionary[word.to_sym] += 1
  end
  dictionary
end

def correct(sentence)
  split_up = sentence.split(' ')
  table = create_word_table
  split_up.each do |word|
# binding.pry
    if table.has_key?(word.downcase.to_sym)
      puts word
    else
      correct_word(word)
    end
  end
end

# If correct sentence finds invalid word, it passes to here
def correct_word(word)

# PLACE CHECKER METHODS
  check_swap(word)




end

def check_swap(word)

binding.pry  



end



input = ARGV.join(" ")
correct(input)
