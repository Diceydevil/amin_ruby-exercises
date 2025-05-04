class HashSet
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

  def add(key)
    if length / @buckets.length.to_f >= @load_factor
      resize
    end

    index = hash(key) % @buckets.length
    
    raise IndexError if index.negative? || index >= @buckets.length

    if @buckets[index].nil?
      @buckets[index] = [key]
    else
      @buckets[index] << key unless @buckets[index].include?(key)
    end
  end

  def resize
    old_buckets = @buckets
    @buckets = Array.new(@buckets.length * 2)
    old_buckets.compact.each do |bucket|
      bucket.each do |k| 
        index = hash(k) % @buckets.length
        
        if @buckets[index].nil?
          @buckets[index] = [k]
        else
          @buckets[index] << k
        end
      end
    end
  end

  def has?(key)
    index = hash(key) % @buckets.length
    raise IndexError if index.negative? || index >= @buckets.length

    return false if @buckets[index].nil?
    
    @buckets[index].include?(key)
  end

  def remove(key)
    index = hash(key) % @buckets.length
    raise IndexError if index.negative? || index >= @buckets.length

    return nil if @buckets[index].nil?

    removed = @buckets[index].delete(key)
    @buckets[index] = nil if @buckets[index].empty?
    removed
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
      bucket.each do |key|
        keys << key
      end
    end
    keys
  end
end