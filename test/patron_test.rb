require 'minitest/autorun'
require './lib/patron'

class PatronTest < Minitest::Test
  attr_reader :bob

  def setup
    @bob = Patron.new("Bob", 20)
  end

  def test_it_exists
    assert_instance_of Patron, bob
  end

  def test_it_has_attributes
    assert_equal "Bob", bob.name
    assert_equal 20, bob.spending_money
  end

  def test_starts_with_no_interests
    assert_equal [], bob.interests
  end

  def test_it_can_add_interests
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], bob.interests
  end
end
