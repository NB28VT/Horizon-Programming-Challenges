require 'pry'


file_name = ARGV[0]

file_to_compress = File.read(file_name)
compressed_file = File.new("compressed_kant.txt", 'w')

coded_hash = {}


w = nil
i = 0

#THIS WORKS! COMPRESSES TO A FILE!!!!! WOOOOOO
file_to_compress.each_char do |char|
  # binding.pry

  if coded_hash.has_key?([w,char].join)
    w = [w,char].join
  else
    compressed_file.write(coded_hash[w])
    coded_hash[([w,char.to_s].join)] = i
    w = char
    i += 1
  end
end


















binding.pry

















# puts """fundamental_kant.txt.compressed created
# ________________________________________________________
# Original file name     : fundamental_kant.txt
# Compressed file name   : fundamental_kant.txt.compressed
# Original file size     : 176K
# Compressed file size   : 71K
# Compression took 0.1989 seconds
# Compressed file is 59.7% smaller than the original file
# Compression Ratio: 2.48 x
# ________________________________________________________"""
