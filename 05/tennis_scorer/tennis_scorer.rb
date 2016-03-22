# -*- encoding : utf-8 -*-
class TennisScorer

  def initialize()
    @scores = ['0', '15', '30', '40', 'Ad']
    @server = 0
    @receiver = 0
  end

  def count_gem
    if @server == 4 && @receiver == 4
      @server, @receiver = 3, 3
    elsif (@server == 4 || @receiver == 4) && (@server - @receiver).abs >= 2
      @server, @receiver = 0, 0
    end
  end

  def score_server
    @server = @server + 1
    count_gem()
  end

  def score_receiver
    @receiver = @receiver + 1
    count_gem()
  end

  def score
    s = @scores[@server]
    r = @scores[@receiver]
    "#{s}-#{r}"
  end

end

puts TennisScorer.new().score