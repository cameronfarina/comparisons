class Array

  def my_rotate(num = 1)
    rotations = (num % self.length)
    rotated_array = self.dup 

    rotations.times do   
        rotated_array << rotated_array.shift
    end

    rotated_array
  end
end  