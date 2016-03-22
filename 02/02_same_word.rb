#!/usr/bin/env ruby

# Find duplication of words in the given
# file and return a Hash indexed by the number
# of lines and containing an Array of
# words that were repetitionseated (same words after
# each other - not duplicates on the line)
def test_words(words, last_word)
  repetitions = []

  words.each do |w|
    w = w.downcase
    repetitions.push(w) if w == last_word
    last_word = w
  end

  [repetitions, last_word]
end

def same_word(file)
  h = {}
  cnt = 1
  last_word = ''

  File.open(file).each_line do |line|
    words = line.split(' ')
    repetitions, last_word = test_words(words, last_word)
    h[cnt] = repetitions if repetitions.size > 0
    cnt += 1
  end

  h
end
