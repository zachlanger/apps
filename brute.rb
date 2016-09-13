#! /usr/bin/env ruby

letters = ('a'..'z').to_a
letters.push('!')
results = 0

letters.each do |one|
    open('brute_results.txt', 'a') { |f| f.puts one}
    results += 1
    letters .each do |two|
        open('brute_results.txt', 'a') { |f| f.puts one + two}
        results += 1
        letters.each do |three|
            open('brute_results.txt', 'a') { |f| f.puts one + two + three}
            results += 1
            letters.each do |four|
                open('brute_results.txt', 'a') { |f| f.puts one + two + three + four}
                results += 1
                letters.each do |five|
                	open('brute_results.txt', 'a') { |f| f.puts one + two + three + four + five}
                	results += 1
            	end
            end
        end
    end
end

puts results