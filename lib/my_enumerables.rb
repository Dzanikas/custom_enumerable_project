module Enumerable
  
  def my_all?
    my_each do |elem|
      next if yield(elem)
      return false
    end
    return true 
  end

  def my_any?
    my_each do |elem|
      next unless yield(elem)
      return true
    end
    return false
  end

  def my_count
    x = 0
    if block_given?
      my_each do |elem|
        if yield(elem)
          x += 1
        end
      end
    else
      my_each do |elem|
      x += 1
      end
    end
    return x
  end

  def my_each_with_index
    i = 0
    my_each do |elem|
      yield elem, i
      i += 1
    end
  end

  def my_inject(initial)
    final = initial.nil? ? self[0] : initial
    my_each do |element|
      final = yield(final, element)
    end
    final
  end

  def my_map
    arr = []
    my_each do |elem|
      arr << yield(elem)
    end
    return arr
  end

  def my_select
    arr = []
    my_each do |elem|
      if yield(elem)
        arr << elem
      end
    end
    return arr
  end

end
# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  
  def my_each
    for i in self
      yield(i)
    end      
  end
  
end
