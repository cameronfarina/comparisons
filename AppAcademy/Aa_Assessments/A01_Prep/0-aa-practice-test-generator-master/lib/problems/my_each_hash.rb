class Hash

  # Write a version of my each that calls a proc on each key, value pair
  def my_each(&prc)

      self.keys.each do |i|
          prc.call(i, self[i] )
      end
    
  end

end
