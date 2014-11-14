#!/usr/bin/env ruby
require 'pry'


#WORKING METHOD NEEDS FIX. PRODUCES LARGE HASH OF WORDS AND HOW OFTEN THEY APPEAR

def create_word_table
  dictionary = Hash.new(0)
  number = 10
  # NEED GSUB METHOD FOR TAKING CARE OF APOSTROPHES,
  File.read("lotsowords.txt").scan(/\w+/).each do |word|
    word.downcase!
    dictionary[word.to_sym] += 1
  end
  dictionary
end

# WORKING METHOD. SUCCESFULLY FINDS WORDS NOT IN DICTIONARY
def correct(sentence)
  split_up = sentence.split(' ')
  table = create_word_table
  split_up.each do |word|
    unless table.has_key?(word.downcase.to_sym)
      correct_word(word, sentence)
    end
  end
end

# If correct sentence finds invalid word, it passes to here
def correct_word(word, sentence)
# PLACE CHECKER METHODS HERE
  check_swap(word, sentence)
end

def check_swap(word, sentence)

bad_word = word
#Does this reinitialize table again? Maybe save into file?
table = create_word_table
# Checks all permutations for mispellings
word.split('').permutation.to_a.each do |word|
  possible_word = word.join
# Repeats downcase. Maybe do this in one spot?
  if table.has_key?(possible_word.downcase.to_sym)
    handler(possible_word, sentence, bad_word)
  end
end

end

# Handles possible word mathces, includes original sentence
def handler(possible_word, sentence, bad_word)

  # Works! Need to dry this up a bit and add input for changing
  sentence = sentence.split
  element_with_bad = sentence.index(bad_word)
  sentence[element_with_bad] = possible_word
  sentence = sentence.join(' ')
  puts "Did you mean \"#{sentence}\"?"
end



input = ARGV.join(" ")
correct(input)
