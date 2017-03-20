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
		else
			entries = @db.execute("SELECT ")
		end

		sorted_entries = entries.sort { |a, b| [a["year"], a["month"], a["day"]] <=> [b["year"], b["month"], b["day"]] }

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

#DRIVER CODE

journal = Gratitude_Journal.new
puts "Welcome to your gratitude journal."
entry_complete = false
until entry_complete 
	puts "Type +read to read your old entries or +write to write a new one."
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
			entry_complete = true
			puts "Great! The entry has been created"
		end
	elsif input == "+read"
		puts "Do you want to see all entries?"
		quantity_input = gets.chomp
		if (quantity_input != "n") && ("yes yeah definitely affirmative all".include? quantity_input)
			quantity = "all"
		else
		end

		journal.print_entries(quantity)
		entry_complete = true
	elsif input == "+quit"
		entry_complete = true
	else
		puts "please enter a valid input"
	end
end

