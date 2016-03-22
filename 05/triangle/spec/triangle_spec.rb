#!/bin/ruby
# -*- encoding : utf-8 -*-
require 'rspec'
require_relative 'spec_helper'
require_relative '../triangle'

describe 'Triangle' do
    it 'equilateral' do
        expect(triangle(5,5,5)).to eq :equilateral
    end    

    it 'isosceles' do
        expect(triangle(5,4,5)).to eq :isosceles
    end    

    it 'isosceles - different order' do
        expect(triangle(5,5,4)).to eq :isosceles
    end    

    it 'scalene' do
        expect(triangle(4,5,6)).to eq :scalene
    end    

    it 'unvalid triangle' do
      expect { triangle(5,5,42) }.to raise_error(TriangleError)
    end    

end