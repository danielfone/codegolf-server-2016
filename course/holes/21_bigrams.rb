# Bigrams are pairs of words found in a text.
#
# This normalises and parses the input and then prints each bigram occuring
# more than once, along with its frequency. The output is sorted by frequency.
#
# For example, in the input text, the most frequeny pair is 'i will' with
# 28 occurences. The first line of the output will therefore be:
#
# i will: 28
#
# The text should be normalised, but punctuation will "stop" a bigram. e.g.
#
#   "Hello you how's it?" has 3 bigrams:
#        "hello you"
#        "you hows"
#        "hows it"
#
#   Whereas "Hello you, how's it?" has 2 bigrams:
#        "hello you"
#        "hows it"
#
# See the test output for examples

module Bigrams
  module_function

  def parse(text)
    tally = {}
    prev_word = nil

    text.split.each do |word|

      word_starts_with_punctuation = word =~ /^[^\w\s]/
      prev_word_ends_with_punctuation = prev_word =~ /[^\w\s]$/

      break_for_punctuation = word_starts_with_punctuation || prev_word_ends_with_punctuation

      if prev_word && ! break_for_punctuation
        # Remove internal punctuation to create bigram
        bigram = [
          prev_word.downcase.gsub(/[^\w\s]/, ''),
          word.downcase.gsub(/[^\w\s]/, ''),
        ].join ' '

        # Increment our counter
        tally[bigram] = 0 unless tally.has_key? bigram
        tally[bigram] += 1
      end

      # Remember our this word for next time
      prev_word = word
    end
    tally
  end

end

results = Bigrams.parse $stdin.read
results
  .sort_by { |bigram, occurences| [-1 * occurences, bigram] }
  .select { |bigram, occurences| occurences > 1 }
  .each { |bigram, occurences| puts "#{bigram}: #{occurences.to_s}"}
