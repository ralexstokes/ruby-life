# Conway's Game of Life, in Ruby

### Usage
    gem install ruby-life
    ruby run.rb $INPUT_FILE

where `run.rb` is an example game in `lib/` and `$INPUT_FILE` is a JSON file with a group of rows.
Each row is an array of strings {'dead', 'alive'} that is used to
populate the program's representation of the game.

For more information on the game itself, see here:
[http://en.wikipedia.org/wiki/Conway's_Game_of_Life](http://en.wikipedia.org/wiki/Conway's_Game_of_Life)

Written with inspiration from [http://rubyquiz.strd6.com/quizzes/193-game-of-life](http://rubyquiz.strd6.com/quizzes/193-game-of-life)

### Todo
Add quantum states to Cell model.  Cell.status = a|alive> + b|dead>. Extend to [quantum cellular automata](http://en.wikipedia.org/wiki/Quantum_cellular_automata)

### Questions, comments?
@ralexstokes on Twitter