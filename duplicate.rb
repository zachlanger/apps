#! /usr/bin/env ruby

arr = [0,4,7,1,6,3,8,3,1]

def duplucate(arry=[])
    counter = 0
    arry.each do |value1|
        dup = 0
        arry.each do |value2|
            if value1 == value2
                dup += 1
            end
        end
        if dup > 1
            return counter
        end
        counter += 1
    end
end

puts "index:#{duplucate(arr)} value:#{arr[duplucate(arr)]}"
