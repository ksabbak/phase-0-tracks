puts "Hamster's name?"

name = gets.chomp

puts "How loud is your Hamster? (1-10)"

volume = gets.chomp.to_i

puts "What fur color?"

furcolor = gets.chomp

puts "Is the Hamster good for adoption? (y/n)"

adoption = gets.chomp

puts "How old is your Hamster?"

input = gets.chomp
age = nil
unless input.length<1
  age = input
end

puts("age#{age}")