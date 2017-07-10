# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue ArgumentError => e
  e.message
  nil
end


# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
  def message
    puts "Thanks for the coffee! Please give me a fruit"
  end
end

class NotFruitError < StandardError
  def message
    puts "Thanks, but I only want fruit. Goodbye!"
  end
end


def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise NotFruitError
  end
end

def feed_me_a_fruit
  begin
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
  rescue CoffeeError => e
    e.message
    retry
  rescue NotFruitError => e
    e.message
  end
end
# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise StandardError, "What kinda best friend? we only know each other for #{yrs_known} years??" unless yrs_known >= 5
    raise StandardError, "What kinda best friend? you dont even have a name" if !name.is_a?(String) || name.length < 1
    raise StandardError, "What kinda best friend? You have no hobbies." if !fav_pastime.is_a?(String) || fav_pastime.length < 1
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end

besti = BestFriend.new("Joe Shmoe", 6, nil)
