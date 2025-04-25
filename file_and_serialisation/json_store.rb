# Goal: Use Ruby’s JSON library to persist data structures.
# Define: A Product class with name, price, stock attrs.

# Task:
# Create an array of several Product instances.
# Serialize the array to JSON and save to products.json.
# Read products.json, parse back into Ruby hashes, and reify into Product objects.

require "json"
require "securerandom"


module StoreBuilder

  class Store
    attr_reader :name, :location, :id, :products
    
    def initialize(name, location)
      @name = name
      @location = location
      @id = SecureRandom.uuid 
      @products = []
    end

    def add_product(product)
      @products << product
    end

    def to_h
      {
        "name" => @name,
        "location" => @location,
        "id" => @id,
        "products" => @products.map(&:to_h)
      }
    end

    def self.from_h(hash)
      store = new(hash["name"], hash["location"])
      store.instance_variable_set(:@id, hash["id"])

      hash["products"].each do |product_hash|
        store.add_product(Product.from_h(product_hash))
      end

      store
    end
  end

  class Product
    attr_reader :name, :price, :stock

    def initialize(name, price, stock)
      @name = name
      @price = price
      @stock = stock
    end

    def to_h
      {
        "name" => @name,
        "price" => @price,
        "stock" => @stock
      }
    end

    def self.from_h(hash)
      new(hash["name"], hash["price"], hash["stock"])
    end
  end

  class SaveStore
    SAVE_DIR = "saves"

    # Save the dock to JSON; returns the filename used
    def self.save(store, filename = nil)
      Dir.mkdir(SAVE_DIR) unless Dir.exist?(SAVE_DIR)
      filename ||= Time.now.strftime("%Y%m%d-%H%M%S") + ".json"
      path = File.join(SAVE_DIR, filename)
  
      File.write(path, JSON.pretty_generate(store.to_h))
  
      filename
    end
  
    # Load a dock from a JSON file; returns a Game instance
    def self.load(filename)
      path = File.join(SAVE_DIR, filename)
      state = JSON.parse(File.read(path))
      Store.from_h(state)
    end
  
    # List available saves (just filenames)
    def self.list_saves
      Dir.glob("#{SAVE_DIR}/*.json").map { |f| File.basename(f) }
    end
  end
end

puts "Welcome to Store Creator!"
puts "1) New Store"
puts "2) Load Store"
print "> "
choice = gets.chomp

store = if choice == "2"
  saves = StoreBuilder::SaveStore.list_saves
  if saves.empty?
    puts "No saved stores found. Creating a new store."
    print "Enter store name: "
    store_name = gets.chomp
    print "Enter store location: "
    store_location = gets.chomp
    StoreBuilder::Store.new(store_name, store_location)
  else
    puts "Choose a store to load:"
    saves.each_with_index { |fn, i| puts "#{i + 1}) #{fn}" }
    print "> "
    save_idx = gets.chomp.to_i - 1
    if save_idx >= 0 && save_idx < saves.length
      StoreBuilder::SaveStore.load(saves[save_idx])
    else
      puts "Invalid selection. Creating a new store."
      print "Enter store name: "
      store_name = gets.chomp
      print "Enter store location: "
      store_location = gets.chomp
      StoreBuilder::Store.new(store_name, store_location)
    end
  end
else
  print "Enter store name: "
  store_name = gets.chomp
  print "Enter store location: "
  store_location = gets.chomp
  StoreBuilder::Store.new(store_name, store_location)
end

loop do
  puts "\nStore Management:"
  puts "1) Add product"
  puts "2) List products" 
  puts "3) Save store"
  puts "4) Exit"
  print "> "
  choice = gets.chomp
  
  case choice
  when "1"
    print "Product name: "
    name = gets.chomp
    print "Price: "
    price = gets.chomp.to_f
    print "Stock: "
    stock = gets.chomp.to_i
    
    store.add_product(StoreBuilder::Product.new(name, price, stock))
    puts "Product added!"
    
  when "2"
    puts "\nProducts:"
    store.products.each_with_index do |product, i|
      puts "#{i+1}. #{product.name} - $#{product.price} (#{product.stock} in stock)"
    end
    puts "No products yet" if store.products.empty?
    
  when "3"
    filename = StoreBuilder::SaveStore.save(store)
    puts "Store saved as #{filename}"
    
  when "4"
    puts "Goodbye!"
    break
  end
end