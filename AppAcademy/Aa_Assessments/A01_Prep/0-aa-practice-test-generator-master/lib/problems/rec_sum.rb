# # Write a recursive method that returns the sum of all elements in an array
# def rec_sum(nums)

#     num = nums.join.to_i
#     return 0 if num == 0

#     1 + rec_sum((num - 1) % 9)

# end

#arr = [1,2,3,4] == 10
#

def rec_sum(nums)

    return 0 if nums.empty?

   nums[0] + rec_sum(nums[1..-1])

end