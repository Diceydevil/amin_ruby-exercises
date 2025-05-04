class HashMap
  def initialize(load_factor = 0.75)
    @load_factor = load_factor
    @buckets = Array.new(10)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
      
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
      
    hash_code
  end

  def set(key, value)
    if length / @buckets.length.to_f >= @load_factor
      resize
    end

    index = hash(key) % @buckets.length
    
    raise IndexError if index.negative? || index >= @buckets.length

    entry = [key, value]

    if @buckets[index].nil?
      @buckets[index] = [entry]
    else
      existing_entry = @buckets[index].find { |e| e[0] == key }
      if existing_entry
        existing_entry[1] = value
      else
        @buckets[index] << entry
      end
    end
  end

  def resize
    old_buckets = @buckets
    @buckets = Array.new(@buckets.length * 2)
    old_buckets.compact.each do |bucket|
      bucket.each do |k, v| 
        index = hash(k) % @buckets.length
        
        if @buckets[index].nil?
          @buckets[index] = [[k, v]]
        else
          @buckets[index] << [k, v]
        end
      end
    end
  end

  def get(key)
    index = hash(key) % @buckets.length    
    raise IndexError if index.negative? || index >= @buckets.length

    return nil if @buckets[index].nil?

    entry = @buckets[index].find { |e| e[0] == key }
    entry ? entry[1] : nil
  end

  def has?(key)
    index = hash(key) % @buckets.length
    raise IndexError if index.negative? || index >= @buckets.length

    return false if @buckets[index].nil?
    
    @buckets[index].any? { |entry| entry[0] == key }
  end

  def remove(key)
    index = hash(key) % @buckets.length
    raise IndexError if index.negative? || index >= @buckets.length

    return nil if @buckets[index].nil?

    entry_index = @buckets[index].find_index { |entry| entry[0] == key }
    return nil if entry_index.nil?

    deleted_value = @buckets[index][entry_index][1]
    @buckets[index].delete_at(entry_index)
    @buckets[index] = nil if @buckets[index].empty?

    deleted_value
  end

  def length
    @buckets.compact.sum { |bucket| bucket.length }
  end

  def clear
    @buckets = Array.new(@buckets.length)
  end

  def keys
    keys = []
    @buckets.compact.each do |bucket|
      bucket.each do |entry|
        keys << entry[0]
      end
    end
    keys
  end

  def values
    values = []
    @buckets.compact.each do |bucket|
      bucket.each do |entry|
        values << entry[1]
      end
    end
    values
  end

  def entries
    entries = []
    @buckets.compact.each do |bucket|
      bucket.each do |entry|
        entries << [entry[0], entry[1]]
      end
    end
    entries
  end
end

