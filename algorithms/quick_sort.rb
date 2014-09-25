require "rspec"

# Quicksort works in place
def quick_sort array, low=0, high=array.size-1
  if high > low
    pivot = partition(array, low, high)
    quick_sort(array, low, pivot-1)
    quick_sort(array, pivot+1, high)
  end
end

def partition array, low, high
  pivot = array[low]
  left = low
  right = high
  while left < right
    # Find an element on left that should be on right
    while (array[left] <= pivot)
      left += 1
    end
    # Find an element on the right that should be on the left
    while (array[right] > pivot)
      right -= 1
    end

    if left < right
      swap(array, left, right)
    end
  end
  # Pivot was first element, swap it where it should be
  array[low] = array[right]
  array[right] = pivot
  # Return the index where the pivot element is. Pivot is in its correct position
  return right
end


# Swap two elements in an array
def swap array, i, j
  array[i], array[j] = array[j], array[i]
end

a = [8,2,4,1,9,3]
quick_sort a
p a

RSpec.describe "quick sort" do
  it "should modify the original array" do
    @array = [4,51,2,3,7,8,9,6,7,3]
    @sorted = @array.sort
    quick_sort @array
    expect(@array).to  eq(@sorted)
  end

end