module Enumerable
  def my_all?
    self.my_each do |element|
      return false if !yield(element)
    end

    true
  end

  def my_any?
    self.my_each do |element|
      return true if yield(element)
    end

    false
  end

  def my_count(number = 0)
    count = 0
    if block_given?
      self.my_each do |element|
        count += 1 if yield(element)
      end
    elsif number != 0
      self.my_each do |element|
        count += 1 if element == number
      end
    else
      return self.length
    end
    count
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
