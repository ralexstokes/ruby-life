require './life'

MODULE_NAME = 'life.rb'

class GridBuilder
  attr_reader :grid_size, :state
  def initialize(grid_size, initial_state = [])
    @grid_size = grid_size
    @state = initial_state
  end

  def create_grid
    grid_size.times do
      state << []
    end

    state.each do |row|
      grid_size.times { row << Cell.new }
    end
  end
end

puts "\n\tLet's make a seed configuration for #{MODULE_NAME}"
puts "\tEnter size of (square) grid."

size = gets.to_i
gm = GridBuilder.new size

gm.create_grid
initial_grid = Grid.new(nil, gm.state)
initial_grid.pad_boundaries!
initial_grid.save('random.json')