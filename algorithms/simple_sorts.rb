module Algorithms::Sort

  # Selection sort: A naive sort that goes through the container and selects the smallest element,
  # putting it at the beginning. Repeat until the end is reached.
  # Requirements: Needs to be able to compare elements with <=>, and the [] []= methods should
  # be implemented for the container.
  # Time Complexity: О(n^2)
  # Space Complexity: О(n) total, O(1) auxiliary
  # Stable: Yes
  # Continuously earch for the smallest element and move it to the ith spot at each iteration of i
  def self.selection_sort array
    for i in 0...array.length
      min = i
      for j in i+1...array.length
        if array[j] < array[min]
          min = j
        end
      end
      swap(array, i, min)
    end
    array
  end

  # Insertion sort: Elements are inserted sequentially into the right position.
  # Requirements: Needs to be able to compare elements with <=>, and the [] []= methods should
  # be implemented for the container.
  # Time Complexity: О(n^2)
  # Space Complexity: О(n) total, O(1) auxiliary
  # Stable: Yes
  # For each element, put it into the sorted section at the front of the list. Swap with the element below until its bigger than the elm below
  def self.insertion_sort array
    for i in 1...array.length
      j = i
      while j > 0 && (array[j-1] > array[j])
        swap(array, j, j-1)
        j -= 1
      end
    end
    array
  end

  # Bubble sort: A very naive sort that keeps swapping elements until the container is sorted.
  # Requirements: Needs to be able to compare elements with <=>, and the [] []= methods should
  # be implemented for the container.
  # Time Complexity: О(n^2)
  # Space Complexity: О(n) total, O(1) auxiliary
  # Stable: Yes
  def self.bubble_sort array
    for i in 0...array.length
      swapped = false
      for j in 1...array.length
        if array[j] < array[j-1]
          swap(array, j, j-1)
          swapped = true
        end
      end
      break unless swapped
    end
    array
  end

  # Swap two elements in an array
  def self.swap array, i, j
    array[i], array[j] = array[j], array[i]
  end

end