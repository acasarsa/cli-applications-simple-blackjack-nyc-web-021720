require "pry"
def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
    puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  card_total = 0
  2.times do
    card_total += deal_card #1 random (1..11)
  end
  display_card_total(card_total)
  card_total
end

def invalid_command
  puts "Please enter a valid command"
end

def hit?(card_total)
  prompt_user
  input = get_user_input

  # until input == "h" || input == "s"
  #   invalid_command
  #   prompt_user
  #   input = get_user_input
  # end

  valid_inputs = ["h", "s"]
  until valid_inputs.include?(input)
    invalid_command
    prompt_user
    input = get_user_input
  end

  if input == "h" # == is the comparison
    card_total += deal_card
     # should this be deal_card? like how am i getting this new random card_value if this was a real program and not a test
  elsif input == "s"
    card_total
  end
end



#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  card_total = initial_round #so only using hit inside this method so therefore hit does have acces to card_total via initial round

  until card_total > 21
    card_total = hit?(card_total)
    display_card_total(card_total)
  end

  if card_total > 21
    end_game(card_total)
  end
end
