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
=end

	attr_accessor :month, :day, :year, :mood, :gratitude

	def initialize
		create_database
	end

	def set_date
		now = Time.now

		@month = case now.month
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

		@day = now.day
		@year = now.year
	end


	def create_entry
		db.execute("INSERT INTO gratitude (month, day, year, mood, gratitude) VALUES (?, ?, ?, ?, ?)", [@month, @day, @year, @mood, @gratitude])
	end

	def check_entry
		<<-ENTRY
		Does this look right: 
		#{@month} #{@day}, #{@year}
		Mood: #{@mood}
		You're grateful for: #{@gratitude}
		ENTRY
	end

private
	def create_database
		# Creating the database:

		db = SQLite3::Database.new("gratitude.db")
		db.results_as_hash = true

		create_table = <<-SQL
		  CREATE TABLE IF NOT EXISTS gratitude(
		    id INTEGER PRIMARY KEY,
		    month TEXT,
		    day INT,
		    year INT,
		    mood TEXT,
		    gratitude TEXT
		  )
		SQL

		db.execute(create_table)
	end
end

#DRIVER CODE

journal = Gratitude_Journal.new
puts "Welcome to your gratitude journal."
loop do
	puts "Type +read to read your old entries or +write to write a new one."
	input = gets.chomp
	if input == "+write"
		journal.set_date
		break
	elsif input == "+read"
		break
	else
		puts "please enter a valid input"
	end
end

