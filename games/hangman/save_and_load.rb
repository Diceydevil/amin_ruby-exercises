class SaveGame
  SAVE_DIR = "saves"

  # Save the game to JSON; returns the filename used
  def self.save(game, filename = nil)
    Dir.mkdir(SAVE_DIR) unless Dir.exist?(SAVE_DIR)
    filename ||= Time.now.strftime("%Y%m%d-%H%M%S") + ".json"
    path = File.join(SAVE_DIR, filename)

    File.write(path, JSON.pretty_generate(game.to_h))

    filename
  end

  # Load a game from a JSON file; returns a Game instance
  def self.load(filename)
    path = File.join(SAVE_DIR, filename)
    state = JSON.parse(File.read(path))
    Hangman::Game.from_h(state)
  end

  # List available saves (just filenames)
  def self.list_saves
    Dir.glob("#{SAVE_DIR}/*.json").map { |f| File.basename(f) }
  end
end
