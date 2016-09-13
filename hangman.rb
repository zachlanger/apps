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

puts "Let's see here"
counter = 0
while counter < words.length
    if words[counter].length != wordLength
        words.delete_at(counter)
    else
        print '.'
        counter += 1
    end
end
puts words
puts "Only #{words.length} possible words."


def Game(lettersToGuess = [], possibleWords = [])
    guess = rand(lettersToGuess.length)
    puts "Is there a #{lettersToGuess[guess]}?"
    answer = gets.chomp
    occurrences = 0
    if answer == 'n'
        counter = 0
        while counter < possibleWords.length
            if possibleWords[counter].include?lettersToGuess[guess]
                possibleWords.delete_at(counter)
                else
                counter += 1
            end
        end
        puts possibleWords
        puts "Only #{possibleWords.length} possible words."
    end
    until answer == 'n'
        occurrences +=1
        puts 'Whats the index'
        answerIndex = gets.chomp.to_i - 1
        counter = 0
        while counter < possibleWords.length
            if possibleWords[counter][answerIndex] != lettersToGuess[guess]
                possibleWords.delete_at(counter)
            else
                counter += 1
            end
        end
        puts possibleWords
        puts "Only #{possibleWords.length} possible words."
        puts 'Does it occur again?'
        answer = gets.chomp
    end
    
    counter = 0
    while counter < possibleWords.length
        if possibleWords[counter].count(lettersToGuess[guess]) != occurrences
            possibleWords.delete_at(counter)
            else
            counter += 1
        end
    end
    puts possibleWords
    puts "Only #{possibleWords.length} possible words."
    lettersToGuess.delete_at(guess)
    if possibleWords.length == 1
        puts 'I GOT IT'
        puts possibleWords
    else
        Game(lettersToGuess, possibleWords)
    end
end

Game(letters, words)