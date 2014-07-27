require "pry"

# == README

# # Anagrams

# ## Description 

# Given a list of words, find all anagrams of a given string

# For reference, an anagram is any word or phrase that exactly
# reproduces the letters in another order.  For example, *carthorse*
# is an anagram of *orchestra*.

# The purpose of this problem is not so much to demonstrate your
# programming prowess, but rather to show how you think about
# approaching this particular problem. This exercise should be done
# using only the Ruby core; please do not use anything from Std­lib
# or third­-party gems.  Please comment your code wherever applicable
# to explain your thinking.

# **Bonus points** for including tests/specs with your
# implementation.

# ## Problem

# Given the words:

# ```
# parts
# flights
# trips
# pears
# fights
# parse
# apple
# spear
# spears
# smear
# spares
# ```

# Find all anagrams of the word `spare`

# Please feel free to use a different markup language if you do not plan to run
# <tt>rake doc:app</tt>.

class Anagram
	def initialize(word)
		@anagram_word = word
	end

	def generate
		words = []
		@anagram_word.split("").each do |letter|
			puts letter
		end
	end

	def words chars, result='', &b
		binding.pry
	  if chars.empty?
	    yield result
	  else
	    chars.length.times do |i|
	      c = (x = chars.clone).slice!(i)
	      words(x, result + c, &b)
	    end
	  end
	end

end