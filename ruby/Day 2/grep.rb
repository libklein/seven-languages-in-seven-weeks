# Task
# Write a simple grep that will print the lines of a file having any
# occurrences of a phrase anywhere in that line. You will need to do
# a simple regular expression match and read lines from a file. (This
# is surprisingly simple in Ruby.) If you want, include line numbers.

path = ARGV[0]
expr = Regexp.new ARGV[1]

IO.readlines(path).each_with_index { |line, line_num| puts "#{line_num}: #{line}" if expr.match?(line) }
