def generate_word
  array_of_words = File.read("5desk.txt").split()
  array_of_filtered_words = []
  filtered_words = File.readlines("5desk.txt")
  filtered_words.each do |i|
    i = i.delete_suffix("\r\n").downcase
    if i.length >= 5 and i.length <= 12
    array_of_filtered_words.append(i)
    end
  end
  secret_word = array_of_filtered_words[rand(0..array_of_filtered_words.length-1)]
  return secret_word
end

def encode_word(secret_word)
  encoded_word = []
  secret_word = secret_word.split('')
  secret_word.each do |i|
    encoded_word.append("_")
  end
  return encoded_word
end

def save_game(x="missing_val", y="missing_val", z="missing_val")
  print("Would you like to save your game? y/n \n")
  player_choice = gets.chomp().downcase
  y = y.join()
  if player_choice.include?("y") == TRUE
    File.write('save_game.rb', "#{x} #{y} #{z}")
    print("Saving game\n")
  else
    print("Not saving game.")
  end
end

def guess_and_update(secret_word, encoded_word)
  print("Which letter?\n")
  guess = gets.chomp().downcase
  if guess.include?('abcdefghijklmnopqrstuvwxyz') == FALSE
    print("Invalid input. Try again.\n")
  end
  guess_and_update(secret_word, encoded_word)
end

def start_the_game
  print("New game or load a saved game?\n")
  player_choice = gets.chomp().downcase
  print("Your input: #{player_choice}\n")
  if player_choice.include?("new") == TRUE
    print("Creating new game\n")
    secret_word = generate_word
    encoded_word = encode_word(secret_word)
    rounds_remaining = 10
    the_game(secret_word, encoded_word, rounds_remaining)
  elsif player_choice.include?("load") == TRUE
    print("Loading saved game\n")
    list = File.read('save_game.rb').split(" ")
    secret_word = list[0]
    encoded_word = list[1].split()
    rounds_remaining = list[2].to_i
    the_game(secret_word, encoded_word, rounds_remaining)
  else
    print("Invalid choice. Try again.")
    start_the_game
  end
end

def guess_character(secret_word, encoded_word)
  print("Which character do you want to try?\n")
  choice = gets.chomp.downcase
  loopcount = 0
  secret_word = secret_word.split('')
  secret_word.each do |i|
    if i == choice
      encoded_word[loopcount] = choice
    end
    loopcount += 1
  end
  print("#{encoded_word}\n")
  return encoded_word
end
  

def the_game(secret_word, encoded_word, rounds_remaining)
  print("Executing the_game()\n")
  print("#{secret_word}\n")
  print("#{encoded_word}\n")
  while rounds_remaining != 0
    encoded_word = guess_character(secret_word, encoded_word)
    if encoded_word.join() == secret_word
      print("YOU WIN!\n")
      exit!
    end
    rounds_remaining -= 1
    print("rounds remaining: #{rounds_remaining}\n")
    save_game(secret_word, encoded_word, rounds_remaining)
  end
  print("You lose...\n")
  exit!
end

start_the_game()
