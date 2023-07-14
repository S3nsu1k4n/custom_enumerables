

module Enumerable
  def my_each
    for element in self
      yield element
    end
  end

  def my_each_with_index
    index = -1
    my_each do |element|
      index += 1
      yield element, index
    end
  end

  def my_select
    array = []
    my_each do |element|
      array << element if yield element
    end
    array
  end

  def my_all?
    array = []
    my_each do |element|
      array << element if yield element
    end
    array == self
  end

  def my_any?
    my_each do |element|
      return true if yield element
    end
    false
  end

  def my_none?
    my_each do |element|
      return false if yield element
    end
    true
  end

  def my_count
    return length unless block_given?

    count = 0
    my_each do |element|
      count += 1 if yield element
    end
    count
  end

  def my_map(my_proc = nil)
    array = []
    my_each do |element|
      array << (my_proc ? my_proc.call(element) : (yield element))
    end
    array
  end

  def my_inject(accumulator = 0)
    my_each do |element|
      accumulator = (yield accumulator, element)
    end
    accumulator
  end

end
