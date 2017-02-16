# PSUEDOCODE FOR ENCRYPT

# -Create a method that takes a string as an argument
# -Get the length of the string
# -For the length number of times, take that 
# 	corresponding letter (first time, first letter, etc.) 
# -Check to see if the letter is in fact a space
#  	-if a space do nothing to the "letter"
#  	-if not a space change the letter to the next letter in the alphabet
#  -Take the new letter and add it to the encrypt string.


def encrypt(secret)
	position = 0
	encryption = ""
	while position < secret.length
		if secret[position] == " "
			encryption += " "
		elsif secret[position] == "z"
			encryption += "a"
		else
			encryption += secret[position].next
		end
		position += 1
	end
	return encryption
end

# puts "What do you want to encrypt?"

# message = gets.chomp

# puts encrypt(message)


# PSUEDOCODE FOR DECRYPT
# -Create a method that takes a string as an argument
# -Create a variable that is equal to the alphabet
# -Get the length of the string
# -For the length number of times, take that 
# 	corresponding letter (first time, first letter, etc.)
# -Check to see if the letter is a space
# 	-if a space do nothing
# 	-if not a space index against alphabet variable 
# 		-take the index before and add it to the decrypt string

def decrypt(password)
	position = 0
	decryption = ""
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	while position < password.length
		if password[position] == " "
			decryption += " "
		else
			new_letter = alphabet[alphabet.index(password[position]) - 1]
			decryption += new_letter
		end
		position += 1
	end
	return decryption
end

# puts "What do you want to decrypt?"

# message = gets.chomp

# puts decrypt(message)

# puts decrypt(encrypt("swordfish"))

# We feel like what this ^ does is pretty self-explanitory. First it takes 
# "swordfish" and encrypts it by applying a cypher that is the alphabet but +1
# (bcdefghi...a) and then decrypts by taking a letter of the alphabet and moving
# backwards one, resulting in doing and then undoing the cryptographic change.


# PSUEDOCODE UI 

# -Ask the user whether they want to encrypt or decrypt a password
# -Get their answer
# 	-if encrypt apply encryption method to the next string the user
# 		 inputs
# 	-if decrypt apply the decryption method to the next string the user
# 		inputs
# 	-otherwise ask again because they're giving us nonsense
# -Ask for password
# -Print result

action = ""
while action.length <= 0
	puts "Would you like to encrypt or decrypt a password?"
	action_answer = gets.chomp
	if action_answer.include? "encrypt"
		action = "encrypt"
	elsif action_answer.include? "decrypt"
		action = "decrypt"
	else
		puts "That's not a valid answer."
	end
end
puts "What is the password you'd like to #{action}?"
password = gets.chomp
if action == "encrypt"
	puts encrypt(password)
elsif action == "decrypt"
	puts decrypt(password)
else
	puts "I'm sorry, something went wrong, this program will self destruct."
end











