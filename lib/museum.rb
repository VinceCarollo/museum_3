require 'pry'

class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recomended = []
    @exhibits.each do |exhibit|
      patron.interests.each do |interest|
        recomended << exhibit if interest == exhibit.name
      end
    end
    recomended
  end

  def attend_events(patron)
    exhibits_to_go_to = recommend_exhibits(patron)

    exhibit_attended = exhibits_to_go_to.max_by do |exhibit|
      exhibit.cost
    end
    p exhibit_attended
    until patron.spending_money == 0 || exhibit_attended.cost > patron.spending_money
      patron.spending_money -= exhibit_attended.cost
      exhibits_to_go_to.delete(exhibit_attended)
    end

  end

  def admit(patron)
    @patrons << patron
    #to work on attend_events without breaking everything
    if patron.name == "TJ" || patron.name == 'Bob2'
      attend_events(patron)
    end
  end

  def patrons_by_exhibit_interest
    patrons_by_exhibit = {}
    @exhibits.each do |exhibit|
      patrons_by_exhibit[exhibit] = @patrons.find_all do |patron|
        interests = patron.interests.map{|interest| interest}
        patron if interests.include?(exhibit.name)
      end
    end
    patrons_by_exhibit
  end
end
