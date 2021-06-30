PROJECT:
Link: https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/file-i-o-and-serialization-ruby-programming

* When a new game is started, your script should load in the dictionary and randomly select a word  between 5 and 12 characters long for the secret word.
* You don’t need to draw an actual stick figure (though you can if you want to!), but do display some sort of count so the player knows how many more incorrect guesses they have before the game ends. You should also display which correct letters have already been chosen (and their position in the word, e.g. _ r o g r a _ _ i n g) and which incorrect letters have already been chosen.
* Every turn, allow the player to make a guess of a letter. It should be case insensitive. Update the display to reflect whether the letter was correct or incorrect. If out of guesses, the player should lose.
* Now implement the functionality where, at the start of any turn, instead of making a guess the player should also have the option to save the game. Remember what you learned about serializing objects… you can serialize your game class too!
* When the program first loads, add in an option that allows you to open one of your saved games, which should jump you exactly back to where you were when you saved. Play on!

NEXT UP:
- Create guesses left counter in the_game
- Write function that lets user guess a letter, then checks if it exists in the secret word, and then makes those characters available / visible.
- Make the_game read from save_game. 1) create function read_save_file 2) make it read hash from save_game.rb 3) see if you can print out the hash values.


LOG:
--- Wednesday June 30, 2021 ---
- Wrote function that writes to a save file as a hash
- Created game loop (function "the_game") where players get the choice to generate a new game or load a saved one.
- Can now write to save game file and read from it, but need to tinker with input type.

--- Tuesday June 29, 2021 ---
- Created repository and README with project outlines.
- Wrote logic that reads 5desk.txt file as an array, filters it for the right word length, and picks a random sample within it.
- Wrote logic that encodes the generated secret word.