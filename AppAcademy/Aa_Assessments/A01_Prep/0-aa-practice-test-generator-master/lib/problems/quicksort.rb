class Array

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    prc ||= Proc.new { |a, b| a <=> b }
    
    return self if self.length < 2
    pivot = self.first
    left = self[1..-1].select { |el| prc.call(el, pivot) == - 1 }
    right = self[1..-1].select { |el| prc.call(el, pivot) != - 1 }

    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end
  
end
