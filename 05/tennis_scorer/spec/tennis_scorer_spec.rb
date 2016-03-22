# -*- encoding : utf-8 -*-
require_relative 'spec_helper'
require_relative '../tennis_scorer'
require 'rspec/its'

describe TennisScorer do

  subject(:scorer) { TennisScorer.new }

  describe '#score'

    context 'at the beginning' do
      its(:score) { should == '0-0' }
    end

    context 'server wins a point' do
      before do
        scorer.score_server()
      end
      its(:score) { should == '15-0' }
    end

    context 'receiver wins a point' do
      before do
        scorer.score_receiver()
      end
      its(:score) { should == '0-15' }
    end

    context 'both win a point' do
      before do
        scorer.score_server()
        scorer.score_receiver()
      end
      its(:score) { should == '15-15' }
    end

    context 'server wins gem' do
      before do
        4.times {
          subject.score_server
        }
      end
      its(:score) { should == '0-0' }
    end


    context 'server wins advantage' do
      before do
        3.times {
          scorer.score_server()
          scorer.score_receiver()
        }
        scorer.score_server()
      end
      its(:score) { should == 'Ad-40' }
    end

   context 'receiver breaks server\'s advantage' do
      before do
        4.times {
          scorer.score_server()
          scorer.score_receiver()
        }
      end
      its(:score) { should == '40-40' }
    end


end
