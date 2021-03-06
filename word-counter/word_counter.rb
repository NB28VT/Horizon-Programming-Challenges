require 'pry'
file = ARGV[0]
number = ARGV[1].to_i
stop_words = File.read("stop_words.txt")
word_hash = Hash.new(0)

File.read(file).scan(/\w+/).each do |word|
  unless stop_words.include?(word.downcase)
    word.downcase!
    word_hash[word.to_sym] += 1
  end
end

word_hash = word_hash.sort_by { |word, count| count }.reverse
word_hash.first(number).each do |word, count|
  print "#{word}: #{count}"
end
