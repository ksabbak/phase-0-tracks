# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# It retrieves the data from the "state_data.rb" file 
# The relative part means it's from the same folder (and file path)
# require sans relative needs the file path in order to work
require_relative 'state_data'

class VirusPredictor

  # Every time we create a new VirusPredictor instance, the initializer gets called
  # Gets called every time VirusPredictor.new is called
  # Sets the initial values for the instance variables @state, @population and 
  # @population_density
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  #Calls predicted_deaths - so the print statement from that gets printed
  #Calls speed_of_spread and returns whatever speed_of_spread returns 
  def virus_effects
    number_of_deaths = predicted_deaths
    speed = speed_of_spread

    "#{@state} will lose #{number_of_deaths} people in this outbreak and will spread across the state in #{speed} months.\n\n"
  end

  private

  # Calculates death based on population density
  # Prints the string
  # Returns nil
  def predicted_deaths
    # predicted deaths is solely based on population density
    
    death_calc_percentage = 0

    if @population_density >= 200
      death_calc_percentage = 0.4
    elsif @population_density >= 150
      death_calc_percentage = 0.3
    elsif @population_density >= 100
      death_calc_percentage = 0.2
    elsif @population_density >= 50
      death_calc_percentage = 0.1
    else
      death_calc_percentage = 0.05
    end
    
    number_of_deaths = (@population * death_calc_percentage).floor
   end

  # Calculates the speed based on population density 
  # prints a string
  # returns nil
  def speed_of_spread   #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.

    if @population_density >= 200
      speed = 0.5
    elsif @population_density >= 150
      speed = 1
    elsif @population_density >= 100
      speed = 1.5
    elsif @population_density >= 50
      speed = 2
    else
      speed = 2.5
    end
  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

# Use a loop
# Iterate through each state
# to create a new VirusPredictor for each
# Call virus effects

STATE_DATA.each do |state, data|
  modle = VirusPredictor.new(state, data[:population_density], data[:population])
  puts modle.virus_effects
end


#=======================================================================
# Reflection Section
__END__

1. What are the differences between the two different hash syntaxes shown in the state_data file?

  So, the colon syntax only works if your keys are symbols, and the "hash rocket" works for everything.

2. What does require_relative do? How is it different from require?

  Both require_relative and require pull data from another file into your current file.
  require_relative works exclusively from the same folder, and require needs the file path
  but can pull a file from anywhere (including the same folder)

3. What are some ways to iterate through a hash?

  Loops, are a great way to itterate through anything. Using the each with the |key, value| block
  parameters is ideal (obviously naming them whatever you want though.) The internet is saying
  that using the each_pair function is a little more common, so I may try that next time
  but it looks like they're essentially the same thing. At least each_pair will make it obvious
  you're working with a hash and not an array.

4. When refactoring virus_effects, what stood out to you about the variables, if anything?
  
  It just baffled me why anyone would think it's necessary to pass in instance variables
  to a method in the instance that already has access to the variables.


5. What concept did you most solidify in this challenge?
  
  Well, I learned about constants, and that was cool. I guess I got a better handle on DRY code.
