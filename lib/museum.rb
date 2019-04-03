class Museum
  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
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
end
