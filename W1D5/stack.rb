class Stack
    def initialize
      @stack = []# create ivar to store stack here!
    end

    def add(el)
      @stack << el # adds an element to the stack
      el
    end

    def remove
      @stack.pop# removes one element from the stack
    end

    def show
      @stack.dup# return a copy of the stack
    end
  end

class Queue
  def initialize
    @queue = []
  end
  def enqueue(el)
    @queue << el
    el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    pair_id = @map.index {|pair| pair[0] == key}
    pair_id ? @map[pair_id][1] = value : @map.push([key,value])
    [key,value]
  end

  def lookup(key)
    @map.each {|pair| return pair[1] if pair[0] == key}
    nil
  end

  def remove(key)
    @map.reject! {|pair| pair[0] == key}
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(arr)
    # map { |el| el.is_a?(Array) ? el.dd_map : el } #from recursion solutions
    arr.map {|el| el.is_a?(Array) ? deep_dup(el) : el}
  end
end
