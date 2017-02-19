#Checks age against birth year
def right_birth_year?(birth_year, age)
	current_year = 2017
	real_age = current_year - birth_year
	if real_age == age || (real_age - 1) == age
		return true
	else
		return false
	end
end

#Checks to see if a person is actually a VAMPIRE
def vampire_check(age_match, order_garlic, insurance_enroll, name)
	vampire_check_message = "Results inconclusive"

	case name 
	when "Drake Cula", "Tu Fang", "Spike", "Angel", "Drusilla", "Edward Cullen", "Carmilla", "Lestat"
		return vampire_check_message = "Definitely a vampire."
	end

	
	if age_match && (order_garlic || insurance_enroll)
		vampire_check_message = "Probably not a vampire"
	elsif !age_match 
		if (order_garlic || insurance_enroll) == false
			vampire_check_message = "Almost certainly a vampire."
		elsif (order_garlic ^ insurance_enroll)
			vampire_check_message = "Probably a vampire."
		else
			return vampire_check_message
		end
	else
		return vampire_check_message
	end
end

def allergy_check
	keep_going = true
	vampire_status = false
	puts "Please input your allergies. When done please type \'done\'"
	while keep_going
		allergy = gets.chomp.downcase
		if "sunshine sunlight".include? allergy
			vampire_status = true
		elsif allergy == "done"
			keep_going = false
		end
	end
	return vampire_status
end

			


# puts "age #{age}"
# puts "birth_year #{birth_year}"
valid_input = false

while !valid_input
	puts "How many employees do you need to check?"
	answer_number = gets.chomp
	if (answer_number == "0" || ("none zero".include? answer_number.downcase))
		#puts "Okay, bye!"
		valid_input = true
	elsif answer_number.to_i == 0
		puts "Please enter a numeral."
	else
		valid_input = true
		employee_number = 1
		while employee_number <= answer_number.to_i

			puts "What is employee ##{employee_number}'s name?"
			name = gets.chomp

			puts "How old is #{name}"
			age = gets.chomp.to_i

			puts "What year was #{name} born?"
			birth_year = gets.chomp.to_i

			puts "Our company cafeteria serves garlic bread. Should we order some for #{name}?"
			garlic_answer = gets.chomp.downcase

			if (garlic_answer != "n") && ("yes yeah definitely affirmative".include? garlic_answer) 
				order_garlic = true
			else
				order_garlic = false
			end

			puts "Would #{name} like to enroll in the company's health insurance"
			insurance_answer = gets.chomp.downcase

			if (insurance_answer != "n") && ("yes yeah definitely affirmative".include? insurance_answer) 
				insurance_enroll = true
			else
				insurance_enroll = false
			end

			puts "Does #{name} have any allergies?"
			allergy_answer = gets.chomp.downcase
			if (allergy_answer != "n") && ("yes yeah definitely affirmative".include? allergy_answer)
				 sun_allergy = allergy_check
			end


			age_match = right_birth_year?(birth_year, age)

			 
			vampire_status = vampire_check(age_match, order_garlic, insurance_enroll, name)
			if sun_allergy && (vampire_status[-1] != ".")
				puts "Probably a vampire."
			else
				puts vampire_status
			end

			employee_number += 1
		end
	end
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."