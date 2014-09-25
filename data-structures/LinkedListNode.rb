require "rspec"

class LinkedListNode

  # Getters and Setters defined
  attr_accessor :data, :next

  def initialize data
    @data = data
  end

  def length
    n = @next
    length = 1
    while n
      n = n.next
      length += 1
    end
    length
  end

  ### Public Methods ###

  # Creates a list from an array
  def self.create_list array
    head = nil
    prev = nil
    array.each do |e|
      node = LinkedListNode.new e
      if prev then prev.next = node end
      prev = node
      head = node unless head
    end
    head
  end

end

RSpec.describe "LinkedListNode tests" do
  it "should be able to return the length" do
    a = LinkedListNode.new(1)
    a.next = LinkedListNode.new(2)
    a.next.next = LinkedListNode.new(3)
    a.next.next.next = LinkedListNode.new(4)
    expect(a.length).to eq 4 
  end

  it "should create a linked list from a " do
    head = LinkedListNode.create_list [1,2,3,5]
    expect(head.data).to eq 1
    expect(head.next.next.next.data).to eq 5
    expect(head.length).to eq 4
  end
end
