# fibs_num takes in a number and returns an array of the n numbers of 
# the fibonacci sequence.
# fibs_num(5) => [0, 1, 1, 2, 3]

def fibs_num(n)

    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2


    prev = fibs_num(n - 1)
    prev << (fibs_num(n - 1)[-1] + fibs_num(n - 1)[-2])
end

class Array
    def quicksort

        return self.dup if self.length <= 1

        pivot = [self.first] 
        left = self[1..-1].select { |el| el < self.first }
        right = self[1..-1].select { |el| el >= self.first }

        left.quicksort + pivot + right.quicksort

    end
end
 p [2, 1, 0, 5, 4].quicksort