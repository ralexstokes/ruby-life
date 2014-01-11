require './lib/life'

SEED_FILE = ARGV[0]

unless SEED_FILE
  puts "\n\tWelcome to #{MODULE_NAME}!"
  puts "\tUsage: `ruby run.rb $INPUT_FILE`"
  puts "\t=>  Generate a seed configuration $INPUT_FILE with `ruby lib/generate_game.rb`"
  puts "\t=>  Example seed files are in ./examples/"
  exit
end

def save_slug
  ARGV[0].split('/')[1].split('.')[0]
end

grid = Grid.new SEED_FILE
# grid.pad_boundaries!
game = GameOfLife.new grid

system 'clear'
100.times do
  game.advance
  sleep 1
  system 'clear'
end

SAVE_FILE = "./#{ARGV[0].split('/')[0]}/#{save_slug}.save.json"
grid.save SAVE_FILE
