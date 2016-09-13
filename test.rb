#!/usr/bin/env ruby

start = Time.now
sleep 1
finish = Time.now
puts "Start: #{start}"
puts "Finish: #{finish}"
puts "Difference: #{finish - start}"

arr = gets.chomp.chars.map(&:to_i)
print arr