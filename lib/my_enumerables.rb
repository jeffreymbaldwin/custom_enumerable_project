module Enumerable

  def my_map
    return to_enum(:my_map) unless block_given?

    new_array = []

    my_each do |element|
      new_array << yield(element)
    end
    new_array
  end 

  def my_select
    return to_enum(:my_select) unless block_given?

    new_array = []

    my_each do |element|
      if yield(element)
        new_array << element
      end
      
    end
    new_array
  end

  def my_all?
    return to_enum(:my_all) unless block_given?

    my_each do |element|
      return false unless yield(element)
    end

    true

  end




end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method

class Array
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end

    self
  end
end
