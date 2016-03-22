#!/usr/bin/env ruby

# looks for vowels
module Summable
    def sum
    end
end

class Array
    include Summable

    def sum
        self.each.reduce(:+)
    end
end

class VowelFinder
    include Summable
    include Enumerable

    def initialize(data)
        @data = data.downcase
        @vowels = ['a', 'e', 'i', 'o', 'u', 'y']
        @result = []
        parse
    end

    def parse
        @data.each_byte do |i|
            @result.push(i.chr) if @vowels.include? i.chr
        end
    end

    def each
        @result.each
    end

    def reduce(block)
        each.reduce(block)
    end
    
    def sum
        reduce(:+)
    end

    def map(&block)
        each.map(&block)
    end

    def max
        each.max
    end

    def min
        each.min
    end
end
