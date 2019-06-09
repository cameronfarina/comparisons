def greatest_common_factor(array)

     (array.min).downto(1) do |factor| 
          if array.all? { |el| el % factor == 0 }
               return factor
          end
     end
end
# 
# p greatest_common_factor([8, 24, 12])       # => 4 
# p greatest_common_factor([15, 30])          # => 15
#  p greatest_common_factor([24, 30, 21])      # => 3
#  p greatest_common_factor([24, 30, 21, 7])   # => 1
#  p greatest_common_factor([16])              # => 16


 def fib(n)
     if n == 0
          return []
     elsif n == 1
          return [1]
     elsif n == 2
          return [1, 1]
     end
     fib = [1, 1]

     while fib.length < n
          last = fib[-1]
          second_to_last = fib[-2]
          next_num = last + second_to_last
          fib << next_num
     end

     return fib
 end

 print fib(2)