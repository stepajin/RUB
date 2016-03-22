class Player
  attr_reader :resting, :critical_health, :first_step

  def initialize()
    @resting = false
    @critical_health = 8
    @first_step = true
  end
  
  def go_to_rest(warrior)
    feel = warrior.feel:backward

    if warrior.health == 20
      @resting = false
    elsif feel.wall?
      warrior.rest!
    elsif feel.empty?
      warrior.walk!:backward
    end
  end

  def should_fire_arrow?(warrior)
    spaces = warrior.look
    not_set = 10000
    min_enemy = not_set
    min_captive = not_set
    
    spaces.each_with_index do |space,index|
      if min_enemy == not_set && space.enemy?
        min_enemy = index
      elsif min_captive == not_set && space.captive?
        min_captive = index
      end
    end
    
    return min_enemy != not_set && min_enemy < min_captive
  end

  def play_turn(warrior)
    #first_step specific for level 9
    if @first_step
      warrior.walk!
      return @first_step = false
    end
    
    
    feel = warrior.feel
    
    if feel.wall?
      return warrior.pivot!
    end
    
    if warrior.health < @critical_health
      @resting = true
      go_to_rest warrior
    elsif @resting
      go_to_rest warrior
    elsif feel.enemy?
      warrior.attack!
    elsif should_fire_arrow? warrior
      warrior.shoot!
    elsif feel.empty?
      warrior.walk!
    elsif feel.captive?
      warrior.rescue!
    end
    
  end
end