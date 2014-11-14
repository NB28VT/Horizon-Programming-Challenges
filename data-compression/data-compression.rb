require 'pry'


file_name = ARGV[0]

file_to_compress = File.read(file_name)






binding.pry

















puts """fundamental_kant.txt.compressed created
________________________________________________________
Original file name     : fundamental_kant.txt
Compressed file name   : fundamental_kant.txt.compressed
Original file size     : 176K
Compressed file size   : 71K
Compression took 0.1989 seconds
Compressed file is 59.7% smaller than the original file
Compression Ratio: 2.48 x
________________________________________________________"""
