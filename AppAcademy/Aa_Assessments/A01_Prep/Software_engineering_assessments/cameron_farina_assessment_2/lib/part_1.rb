def my_reject(array, &prc)
    new_array = []

    array.each { |ele| new_array << ele if prc.call(ele) == false }

    new_array
end

def my_one?(array, &prc)
    new_array = []
    array.each { |ele| new_array << ele if prc.call(ele) == true }

    return true if new_array.length == 1
    false
end

def hash_select(hash, &prc)
    new_hash = {}

    hash.each do |k, v| 
        if prc.call(k, v)
            new_hash[k] = v
        end
    end
    new_hash
end

def xor_select(array, prc_1, prc_2)
    new_array = []
    
    array.each do |el|
        if (prc_1.call(el) == true && prc_2.call(el) == false)  || (prc_2.call(el) == true && prc_1.call(el) == false)
            new_array << el
        end
    end 
    new_array
end

def proc_count(num, array)
    count = 0
    array.each { |proc_object| count += 1 if proc_object.call(num) == true }
    count
end