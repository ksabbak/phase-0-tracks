# Sometimes we just need to pause and remind ourselves what we're grateful for.
# K. Sabbak March 2017


#PSEUDOCODE STUFF:
#  Welcome the user to the program.
#  Ask if they want to read or write
#  If read: Get info from database
#  If write: Get date, gratitude from user, save to database.

=begin	POTENTIAL FORMAT

[MONTH] [DAY], [YEAR]
You were feeling: [MOOD]
And you were grateful for: [GRATITUDE]
	
=end

require 'sqlite3'
require 'date'

class Gratitude_Journal
=begin	CLASS VARS
	month 		: 	String
	day 		: 	Int
	year 		:	Int
	mood 		: 	String
	gratitude 	: 	String
	db 			: 	database?	
=end

	attr_accessor :month, :day, :year, :mood, :gratitude

	def initialize
		create_database
	end

	def set_date
		now = Time.now

		@month = now.month
		@day = now.day
		@year = now.year
	end


	def create_entry
		@db.execute("INSERT INTO gratitude (month, day, year, mood, gratitude) VALUES (?, ?, ?, ?, ?)", [@month, @day, @year, @mood, @gratitude])
	end

	def check_entry
		<<-ENTRY
		Does this look right: 
		#{get_month(@month)} #{@day}, #{@year}
		Mood: #{@mood}
		You're grateful for: #{@gratitude}
		ENTRY
	end

	def print_entries(range)
		
		if range == "all"
			entries = @db.execute("SELECT * FROM gratitude")
		elsif range.include? "."
			date_array = parse_date(range)
			entries = @db.execute("SELECT * FROM gratitude WHERE month = #{date_array[0]} AND day = #{date_array[1]} AND year = #{date_array[2]}")
		else
			entries = @db.execute("SELECT * FROM gratitude WHERE year = #{range}")
		end

		sorted_entries = sort_entries(entries)

		if sorted_entries.length == 0
			puts "Sorry, there are no entries for that range."
		else
			sorted_entries.each do |entry|
				puts <<-ENTRY
	#{get_month(entry['month'])} #{entry['day']}, #{entry['year']}
	Mood: #{entry['mood']}
	You're grateful for: #{entry['gratitude']}

			ENTRY
			end
		end
	end

	def print_entries_with_id(range)
		
		if range == "all"
			entries = @db.execute("SELECT * FROM gratitude")
		elsif range.include? "."
			date_array = parse_date(range)
			entries = @db.execute("SELECT * FROM gratitude WHERE month = #{date_array[0]} AND day = #{date_array[1]} AND year = #{date_array[2]}")
		else
			entries = @db.execute("SELECT * FROM gratitude WHERE year = #{range}")
		end

		sorted_entries = sort_entries(entries)

		if sorted_entries.length == 0
			puts "Sorry, there are no entries for that range."
		else
			sorted_entries.each do |entry|
				puts <<-ENTRY
	#{entry['id']}	#{get_month(entry['month'])} #{entry['day']}, #{entry['year']}
	Mood: #{entry['mood']}
	You're grateful for: #{entry['gratitude']}

			ENTRY
			end
		end
	end

	def sort_entries(entries)
		entries.sort { |a, b| [a["year"], a["month"], a["day"]] <=> [b["year"], b["month"], b["day"]] }
	end

	def how_many_entries(date_string)
		date_array = parse_date(date_string)
		entries = @db.execute("SELECT * FROM gratitude WHERE month = #{date_array[0]} AND day = #{date_array[1]} AND year = #{date_array[2]}")
		entries.length
	end

	def delete_entry(entry)
		if entry.include? "."
			date_array = parse_date(entry)
			@db.execute("DELETE FROM gratitude WHERE month = #{date_array[0]} AND day = #{date_array[1]} AND year = #{date_array[2]}")
		else
			@db.execute("DELETE FROM gratitude WHERE id = #{entry}")
		end
	end

	def parse_date(date)
		date_array = date.split(".")
		date_array.map do |part|
			part.to_i
		end
		date_array
	end

	private
		def create_database
			# Creating the database:

			@db = SQLite3::Database.new("gratitude.db")
			@db.results_as_hash = true

			create_table = <<-SQL
			  CREATE TABLE IF NOT EXISTS gratitude(
			    id INTEGER PRIMARY KEY,
			    month INT,
			    day INT,
			    year INT,
			    mood TEXT,
			    gratitude TEXT
			  )
			SQL

			@db.execute(create_table)
		end

		def get_month(int)
			case int
			when 1 then "January"
			when 2 then "February"
			when 3 then "March"
			when 4 then "April"
			when 5 then "May"
			when 6 then "June"
			when 7 then "July"
			when 8 then "August"
			when 9 then "September"
			when 10 then "October"
			when 11 then "November"
			when 12 then "December"
			else "??"
			end
		end
end

def commands
	<<-COMMANDS
	Commands:
		+read 		read your old entries 
		+write		write a new entry
		+delete		delete an old entry 
		+quit 		quit
	COMMANDS
end



#DRIVER CODE
puts "Welcome to your gratitude journal."
journal = Gratitude_Journal.new
puts commands

loop do
	puts "Please enter a command: " 
	input = gets.chomp
	if input == "+write"
		journal.set_date
		puts "Please enter your mood: "
		journal.mood = gets.chomp 
		puts "What are you grateful for?"
		journal.gratitude = gets.chomp
		puts journal.check_entry
		puts ""
		puts "Do you want to change it?"
		change_input = gets.chomp
		unless (change_input != "n") && ("yes yeah definitely affirmative".include? change_input)
			journal.create_entry
			puts "Great! The entry has been created"
		end
	elsif input == "+read"
		puts "Do you want to see all entries?"
		quantity_input = gets.chomp
		if (quantity_input != "n") && ("yes yeah definitely affirmative all".include? quantity_input)
			quantity = "all"
		else
			puts "Please enter the year you want to see the entries from: "
			quantity = gets.chomp
		end
		journal.print_entries(quantity)
	elsif input == "+delete"
		puts "Please enter the date of the entry you want to delete (MM.DD.YYYY)"
		delete_input = gets.chomp
			if delete_input.include? "."
				if journal.how_many_entries(delete_input) == 0
					puts "There are no entries for that date"
				elsif journal.how_many_entries(delete_input) > 1
					puts "There is more than one entry for that date."
					journal.print_entries_with_id(delete_input)
					puts "Please enter the number you see before the entry to delete"
					delete_id = gets.chomp
					journal.delete_entry(delete_id)
					puts "Entry deleted"
				else
					journal.delete_entry(delete_input)
					puts "Entry deleted"
				end
			else
				puts "Invalid input"
			end
	elsif input == "+help"
		puts commands
	elsif input == "+quit"
		break
	else
		puts "please enter a valid input, don't forget the +"
	end
end

