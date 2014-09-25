require_relative "algorithms.rb"
require "rspec"

module Algorithms::Sort
  
  # Mergesort divides the array in half, sorts each half of those halves, and then merges them
  # back together. Each half is sorted recusively. Base case is when array.size is 1, already sorted.
  # 
  # Merge method operates by copying all elements from target array segment into a helper array, keeping
  # track of where the left and right halves should be. Then you iterate through helper, copying the smaller
  # element from each half into the original array. At the end, copy any remaining elements into the sorted array
  # Runtime: O(n log n), average and worst case
  # Memory: O(n) auxiliary
  def self.mergesort array, helper=[], low=0, high=array.size-1
    if high > low
      mid = (low+high)/2
      # Sort left and right halves
      mergesort(array, helper, low, mid)
      mergesort(array, helper, mid+1, high)
      # Merge halves
      merge(array, helper, low, mid, high)
    end
  end

  def self.merge array, helper, low, mid, high
    # Copy both halves into helper array
    low.upto(high) do |i|
      helper[i] = array[i]
    end

    helper_left = low
    helper_right = mid+1
    curr = low #start curr at bottom

    # Iterate through helper array. Compare elements in left and right halves,
    # copying the smaller element from the two halves into the original array
    # (iterating with curr)
    while (helper_left <= mid && helper_right <= high)
      if helper[helper_left] <= helper[helper_right]
        array[curr] = helper[helper_left]
        helper_left += 1
      else # If right elm is smaller than left elm
        array[curr] = helper[helper_right]
        helper_right += 1
      end
      curr += 1
    end

    # Copy the rest of the left side of the helper array into the target array
    remaining = mid - helper_left
    (0..remaining).each do |i|
      array[curr+i] = helper[helper_left+i]
    end
  end
end

RSpec.describe "mergesort" do
  it "should modify the original array" do
    @array = [4,51,2,3,7,8,9,6,7,3]
    @sorted = @array.sort
    Algorithms::Sort.mergesort @array
    p @array
    p @sorted
    expect(@array).to  eq(@sorted)
  end

end

