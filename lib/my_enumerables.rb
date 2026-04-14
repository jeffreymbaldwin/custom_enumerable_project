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
    return to_enum(:my_all?) unless block_given?

    my_each do |element|
      return false unless yield(element)
    end

    true

  end

  def my_any?
    return to_enum(:my_any?) unless block_given?

    my_each do |element|
      return true if yield(element)
    end

      false

  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    my_each do |element|
      return false if yield(element)
    end

    true

  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0

    my_each do |element|
      yield(element, i)
      i += 1  
    end

    self
  end

  def my_count
    return self.length unless block_given?
    count = 0
    my_each do |element|
      if yield(element)
        count += 1
      end
    end
    count
  end

  def my_inject(initial)
   return to_enum(:my_inject) unless block_given?
    acc = initial

   my_each_with_index do |element, index|

    acc = yield(acc, element)
     
   end
   acc 
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

