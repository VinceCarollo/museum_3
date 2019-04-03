require 'minitest/autorun'
require './lib/patron'
require './lib/exhibit'
require './lib/museum'

class MuseumTest < Minitest::Test
  attr_reader :dmns,
              :gems_and_minerals,
              :dead_sea_scrolls,
              :imax,
              :bob,
              :sally

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    @dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    @imax = Exhibit.new("IMAX", 15)
    @bob = Patron.new("Bob", 20)
    @sally = Patron.new("Sally", 20)
  end

  def test_it_exists
    assert_instance_of Museum, dmns
  end

  def test_it_has_name
    assert_equal "Denver Museum of Nature and Science", dmns.name
  end

  def test_it_starts_with_no_exhibits
    assert_equal [], dmns.exhibits
  end

  def test_it_can_add_exhibits
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    expected = [gems_and_minerals, dead_sea_scrolls, imax]
    assert_equal expected, dmns.exhibits
  end

  def test_it_can_recommend_exhibits
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")
    sally.add_interest("IMAX")

    expected = [gems_and_minerals, dead_sea_scrolls]

    assert_equal expected, dmns.recommend_exhibits(bob)
    assert_equal [imax], dmns.recommend_exhibits(sally)
  end
end
