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

  def admit(patron)
    @patrons << patron
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
