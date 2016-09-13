#!/usr/bin/env ruby

steps = gets.chomp.gsub(/[()]/, "").split(" ")
down = 'w'
front = 'b'
right = 'r'
back = 'g'
left = 'o'
up = 'y'


steps.each do |step|
    if step == 'x'
        temp = up
        up = front
        front = down
        down = back
        back = temp
        next
    elsif step == 'x’'
        temp = up
        up = back
        back = down
        down = front
        front = temp
        next
    elsif step == 'y'
        temp = front
        front = right
        right = back
        back = left
        left = temp
        next
    elsif step == 'y’'
        temp = front
        front = left
        left = back
        back = right
        right = temp
        next
    elsif step[0] == 'D'
        color = down
    elsif step[0] == 'F'
        color = front
    elsif step[0] == 'R'
        color = right
    elsif step[0] == 'B'
        color = back
    elsif step[0] == 'L'
        color = left
    elsif step[0] == 'U'
        color = up
    end

    if step[1] == '’'
        inverse = true
    else
        inverse = false
    end
    
    str = 'rotate(\'' + color + '\', ' + inverse.to_s + ')'
        
    if step[1] == '2'
        puts str
    end
    
    puts str
end

