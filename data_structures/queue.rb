# Queue represented by an Array, where the end of the array is the "front" of the FIFO queue
class Queue

  attr_reader :store
  
  def initialize input
    if input.kind_of? Array
      @store = input
    else
      @store = Array.new
    end
  end

  def enqueue(element)
    @store.unshift(element)
  end

  def dequeue
    @store.pop
  end

  def size
    @store.size
  end

end