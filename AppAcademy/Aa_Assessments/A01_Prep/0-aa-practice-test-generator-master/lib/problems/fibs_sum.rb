# Implement a method that finds the sum of the first n
# fibonacci numbers recursively. Assume n > 0
def fibs_sum(n)
 return 1 if n == 1
 return 2 if n == 2

 fibs_sum(n-1) + fibs_sum(n-2) + 1
end

#1, 1, 2, 3, 5, 8, 13, 21
# 1 = 1
# 2 = 2
# 3 = 4
# 4 = 7
# 5 = 12
# 6 = 20
# 7 = 33
