require 'json'

MODULE_NAME = 'ruby-life'

class Cell
  attr_accessor :alive, :neighbors
  alias :alive? :alive

  def initialize(status = nil, seed_probability = 0.5)
    case status
    when 'alive'
      @alive = true
    when 'dead'
      @alive = false
    else
      @alive = seed_probability > rand
    end
  end

  def update
    if alive?
      self.alive = false if neighbors < 2 || neighbors > 3
    else
      self.alive = true if neighbors == 3
    end
  end

  def to_i
    alive? ? 1 : 0
  end

  def to_s
    alive? ? 'O' : '-'
  end

  def to_sym
    alive? ? :alive : :dead
  end
end

class Grid
  attr_accessor :state, :grid_size

  def initialize(input_file = nil, input_state = [])
    @state = input_state
    if input_file
      input_hash = load input_file
      make_cells input_hash
    end
    @grid_size = state.size
  end

  def load(input_file)
    File.open(input_file) do |f|
      input_json = f.read
      JSON.parse input_json
    end
  end

  def save(output_file)
    output_hash = {}
    state.each.with_index(1) do |row, index|
      output_hash["row_#{index}"] = row.map do |cell|
        cell.to_sym
      end
    end
    File.open(output_file, 'w') do |f|
      f.write output_hash.to_json
    end
  end

  def make_cells(input_hash)
    input_hash.each do |col, row|
      state << row.map { |cell| Cell.new cell }
    end
  end

  def pad_boundaries!
    state.map do |row|
      row.unshift Cell.new('dead')
      row.push Cell.new('dead')
      self.grid_size = row.size
    end
    self.state = state.unshift dead_row
    self.state = state.push dead_row
  end

  def dead_row
    Array.new(grid_size) { Cell.new('dead') }
  end

  def next(timestep)
    timestep.times do
      state.each.with_index do |row, i|
        row.each.with_index do |cell, j|
          cell.neighbors = find_neighbors i, j
        end
      end
      state.flatten.each { |cell| cell.update }
    end
  end

  def find_neighbors(i, j)
    neighbors = index_array.map do |k,l|
      k_index, l_index = modular_indices (i+k), (j+l)
      state[k_index][l_index]
    end
    neighbors.flatten.map(&:to_i).inject(:+)
  end

  def index_array
    [
      [-1,-1], [-1,0], [-1, 1], # cells above self
      [0, -1], [0, 1],          # cells left and right of self
      [1, -1], [1, 0], [1,1]    # cells below self
    ]
  end

  def modular_indices(i, j)
    [i, j].map { |index| index % grid_size }
  end

  def display
    state.each { |row| puts row.join cell_separator }
    puts
  end

  def cell_separator
    '  '
  end
end

class GameOfLife
  attr_accessor :grid, :time, :timestep

  def initialize(grid, initial_time = 0, timestep = 1)
    @grid = grid
    @time = initial_time
    @timestep = timestep
  end

  def advance
    puts "Time: #{time}", "-" * 10
    self.time += timestep

    grid.display
    grid.next timestep
  end
end

