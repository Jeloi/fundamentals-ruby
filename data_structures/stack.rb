# Stack represented by an Array, where the end of the array is the "top" of the LIFO stack
class Stack

  attr_reader :store

  def initialize input
    if input.kind_of? Array
      @store = input
    else
      @store = Array.new
    end
  end

  def peek
    @store.last
  end

  def push(element)
    @store.push(element)
  end

  def pop
    @store.pop
  end

  def size
    @store.size
  end

  def to_s
    @store
  end

end