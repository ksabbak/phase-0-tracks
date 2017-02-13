puts "Hamster's name?"

name = gets.chomp

puts "How loud is your Hamster? (1-10)"

volume = gets.chomp.to_i

puts "What fur color?"

furcolor = gets.chomp

puts "Is the Hamster good for adoption? (y/n)"

if "yes yeah true".include? gets.chomp.downcase
	adoption = true
else
	adoption = false
end

puts "How old is your Hamster?"

input = gets.chomp
age = nil
unless input.length<1
  age = input.to_i
end

puts "Name: #{name}"
puts "Age: #{age}"
puts "Loudness level: #{volume}"
puts "Fur color: #{furcolor}"
puts "Is it adoptable?: #{adoption}"
puts("Age: #{age}")