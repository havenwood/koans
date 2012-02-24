#!/usr/bin/env ruby

class Greed
  class DiceSet
    attr_reader :values
    def roll num
      @values = Array.new(num) { rand 1..5 }
    end
  end
end

begin
  require 'minitest/autorun'
  require 'minitest/pride'
rescue
  puts "Ruby 1.8 is deprecated, please use a modern Ruby."
end

class TestGreed < MiniTest::Unit::TestCase
  def setup
    @game = Greed.new
    @dice = Greed::DiceSet.new
  end
  
  def test_that_game_is_created
    refute_nil @game
  end
  
  def test_that_dice_are_created
    refute_nil @dice
  end
  
  def test_rolling_the_dice_returns_a_set_of_integers_between_1_and_6
    @dice.roll(5)
    assert @dice.values.is_a?(Array), "should be an array"
    assert_equal 5, @dice.values.size
    @dice.values.each do |value|
      assert value >= 1 && value <= 6, "value (#{value}) must be between 1 and 6"
    end
  end

  def test_dice_values_do_not_change_unless_explicitly_rolled
    @dice.roll(5)
    first_time = @dice.values
    second_time = @dice.values
    assert_equal first_time, second_time
  end

  def test_you_can_roll_different_numbers_of_dice
    @dice.roll(3)
    assert_equal 3, @dice.values.size

    @dice.roll(1)
    assert_equal 1, @dice.values.size
  end
end