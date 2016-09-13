#! /usr/bin/env ruby

words = Array.new
File.open("words.txt").each do |line|
    word = line.chomp.to_s
    words.insert(-1, word)
end

puts 'HANGMAN'
puts 'Think of a word'
puts 'How many letters is it?'
wordLength = gets.chomp.to_i
letters = ('a'..'z').to_a

counter = 0
while counter < words.length
    if words[counter].length != wordLength
        words.delete_at(counter)
        else
        print '.'
        counter += 1
    end
end

def Game(lettersToGuess = [], possibleWords = [])
    guessIndex = rand(lettersToGuess.length)
    puts "Is there a/an #{lettersToGuess[guessIndex]}?"
    present = gets.chomp
    if present == 'y'
        puts 'How many times does it occur?'
        occurrences = gets.chomp.to_i
        occurrences.times do
            puts "Where's the letter located?"
            answerIndex = gets.chomp.to_i - 1
            counter = 0
            while counter < possibleWords.length
                if possibleWords[counter][answerIndex] != lettersToGuess[guessIndex]
                    possibleWords.delete_at(counter)
                else
                    counter += 1
                end
            end
        end
        counter = 0
        while counter < possibleWords.length
            if possibleWords[counter].count(lettersToGuess[guessIndex]) != occurrences
                possibleWords.delete_at(counter)
                else
                counter += 1
            end
        end
    else
        counter = 0
        while counter < possibleWords.length
            if possibleWords[counter].include?(lettersToGuess[guessIndex])
                possibleWords.delete_at(counter)
            else
                counter += 1
            end
        end
    end
    if possibleWords.length == 1 || possibleWords.length == 0
        puts possibleWords
    else
        puts possibleWords
        puts "#{possibleWords.length} possible words"
        lettersToGuess.delete_at(guessIndex)
        Game(lettersToGuess, possibleWords)
    end
end

Game(letters, words)