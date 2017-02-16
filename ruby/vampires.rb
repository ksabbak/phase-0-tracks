puts "What's your name?"
name = gets.chomp

puts "How old are you?"
age = gets.chomp.to_i

puts "What year were you born?"
birth_year = gets.chomp.to_i

puts "Our company cafeteria serves garlic bread. Should we order some for you?"
garlic_answer = gets.chomp

if "yes yeah definitely affirmative".include? garlic_answer
	order_garlic = true
else
	order_garlic = false
end

puts "Would you like to enroll in the company's health insurance"
insurance_answer = gets.chomp

if "yes yeah definitely affirmative".include? insurance_answer
	insurance_enroll = true
else
	insurance_enroll = false
end


def right_birth_year?(birth_year, age)
	current_year = 2017
	real_age = current_year - birth_year
	if real_age == age || (real_age - 1) == age
		return true
	else
		return false
	end
end

def vampire_check(age_match, order_garlic, insurance_enroll, name)
	vampire_check_message = "Results inconclusive"

	if name == "Drake Cula" || name ==  "Tu Fang" || name ==  "Spike" || name == "Angel" || name ==  "Drusilla" || name ==  "Edward Cullen" || name == "Carmilla"
		vampire_check_message = "Definitely a vampire."
	elsif age_match && (order_garlic || insurance_enroll)
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

# puts "age #{age}"
# puts "birth_year #{birth_year}"
age_match = right_birth_year?(birth_year, age)

puts vampire_check(age_match, order_garlic, insurance_enroll, name)
