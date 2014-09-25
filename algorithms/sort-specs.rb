require 'rspec'
require_relative 'algorithms.rb'

RSpec.describe "sorting algorithms" do
  before do
    @a = [3,4,6,1,2,3,0,10,5]
    @a_sorted = [0, 1, 2, 3, 3, 4, 5, 6, 10]
  end
  it { expect{Algorithms::Sort.insertion_sort @a}.to change{@a}.to(@a_sorted)  } 
  it { expect{Algorithms::Sort.selection_sort @a}.to change{@a}.to(@a_sorted)  } 
  it { expect{Algorithms::Sort.bubble_sort @a}.to change{@a}.to(@a_sorted)  } 
end