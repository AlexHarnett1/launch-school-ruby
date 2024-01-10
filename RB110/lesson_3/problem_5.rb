require "pry-byebug"
def least_common_char(str)
  hsh = {}
  str.downcase.chars.each do |char|
    if hsh.has_key?(char)
      hsh[char] += 1
    else
      hsh[char] = 1
    end
  end
  least_common = hsh.keys[0]
  hsh.each do |key, value|
    least_common = key if value < hsh[least_common]
  end
  least_common
end

# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'

# The tests above should print "true".