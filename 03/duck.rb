#!/usr/bin/env ruby

# @TODO: define class Duck with constructor
# that takes as parameters `name` and `age` of
# the duck
class Duck
  @@num_quacks = 0

  def self.can_fly
    true
  end

  def self.can_swim
    true
  end

  def self.num_quacks
    @@num_quacks
  end

  protected

  attr_reader :age

  public

  attr_reader :name, :flying, :swimming, :num_quacks

  def initialize(name, age)
    @name = name
    @age = age
    @flying = false
    @swimming = false
    @num_quacks = 0
  end

  def flying=(flying)
    @flying = flying
    @swimming = false if flying
  end

  def swimming=(swimming)
    @swimming = swimming
    @flying = false if swimming
  end

  def flying?
    @flying
  end

  def swimming?
    @swimming
  end

  def quack
    @num_quacks += 2
    @@num_quacks += 2
    'quack quack'
  end

  def compare(duck)
    if @age == duck.age
      0
    elsif @age > duck.age
      1
    else
      -1
    end
  end

  def fly!
    self.flying = true
  end
end
