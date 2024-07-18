module Enumerable
  def my_all?
    self.my_each{ |element| return false if !yield(element)}
    true
  end

  def my_any?
    self.my_each{ |element| return true if yield(element) }
    false
  end

  def my_count(number = {no: "way"})
    count = 0
    if block_given?
      self.my_each { |element| count += 1 if yield(element)}
    elsif number != {no: "way"}
      self.my_each { |element| count += 1 if element == number}
    else
      return self.length
    end
    count
  end

  def my_each_with_index
    index = 0
    while index < self.length
      yield(self[index], index)
      index += 1
    end
    self
  end

  def my_inject(initial_value = nil)
    if block_given?
      initial_value = self[0] unless initial_value
      self.my_each{ |element| initial_value = yield(initial_value, element) }
      initial_value
    else
      "Give me a block"
    end
  end

  def my_map
    if block_given?
      new_array = []
      self.my_each{ |element| new_array << yield(element)}
      new_array
    else
      "Give me a block"
    end
  end

  def my_none?
    if block_given?
      self.my_each{ |element| return false if yield(element)}
      true
    else
      "Give me a block"
    end
  end

  def my_select
    if block_given?
      new_array = []
      self.my_each{ |element| new_array << element if yield(element)}
      new_array
    else
      "Give me a block"
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for element in self
      yield(element)
    end
    self
  end
end
