class StickMan
  STAGES = [
    # 0 wrongs
    <<~ART,
        +---+
        |   |
            |
            |
            |
            |
      =========
    ART

    # 1 wrong
    <<~ART,
        +---+
        |   |
        O   |
            |
            |
            |
      =========
    ART

    # 2 wrongs
    <<~ART,
        +---+
        |   |
        O   |
        |   |
            |
            |
      =========
    ART

    # 3 wrongs
    <<~ART,
        +---+
        |   |
        O   |
       /|   |
            |
            |
      =========
    ART

    # 4 wrongs
    <<~ART,
        +---+
        |   |
        O   |
       /|  |
            |
            |
      =========
    ART

    # 5 wrongs
    <<~ART,
        +---+
        |   |
        O   |
       /|  |
       /    |
            |
      =========
    ART

    # 6 wrongs
    <<~ART,
        +---+
        |   |
        O   |
       /|  |
       /   |
            |
      =========
    ART

    # 7 wrongs (full figure)
    <<~ART
        +---+
        |   |
        O   |
       /|  |
       /   |
            |
      =========
    ART
  ]
  def initialize(wrong_count)
    @wrong_count = wrong_count
  end

  def draw
    puts STAGES[[@wrong_count, STAGES.size - 1].min]
  end
end
