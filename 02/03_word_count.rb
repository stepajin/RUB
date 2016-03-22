#!/usr/bin/env ruby

def symbol?(symbol)
  symbols = ['.', ',', '?', '!', '"']
  symbols.include?(symbol)
end

def trim_word(word)
  from = 0
  to = word.length - 1
  from += 1 while symbol?(word[from])
  to -= 1 while symbol?(word[to])

  cut_from_end = (word.length - to - 1)
  length = word.length - cut_from_end
  word[from, length]
end

def get_words(file)
  words = []
  File.open(file).each_line do |line|
    line.split(' ').each do |w|
      words.push(trim_word(w).downcase)
    end
  end

  words
end

def word_count(file)
  counts = {}
  words = get_words(file)
  words.each do |w|
    key = w.to_sym
    counts[key] = counts[key].nil? ? 1 : counts[key] + 1
  end

  counts
end

puts(word_count('spec/words/01.txt'))
