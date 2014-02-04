require_relative '../lib/ruby-life'

describe Cell do
  let (:cell_alive) { Cell.new('alive') }
  let (:cell_dead) { Cell.new('dead') }
  let (:alive_probability) { 1 }
  let (:dead_probability ) { 0 }

  describe '#initialize' do
    it 'should be a Cell object that keeps track of dead or alive status' do
      cell_alive_rand = Cell.new(nil, alive_probability)
      cell_dead_rand = Cell.new(nil, dead_probability)

      cell_alive.alive?.should be_true
      cell_dead.alive?.should be_false
      cell_alive_rand.alive?.should be_true
      cell_dead_rand.alive?.should be_false
    end
  end

  describe '#update' do
    it 'should kill a live cell if it has less than 2 neighbors' do
      cell_alive.neighbors = 1
      cell_alive.update
      cell_alive.alive?.should be_false
    end

    it 'should kill a live cell if it has more than 3 neighbors' do
      cell_alive.neighbors = 4
      cell_alive.update
      cell_alive.alive?.should be_false
    end

    it 'should make a dead cell alive if it has 3 neighbors' do
      cell_dead.neighbors = 3
      cell_dead.update
      cell_dead.alive?.should be_true
    end
  end

  describe '#to_{i, s, sym} - representation methods' do
    it 'should yield {1, "O", :alive} for alive cell' do
      cell_alive.to_i.should eq 1
      cell_alive.to_s.should eq 'O'
      cell_alive.to_sym.should eq :alive
    end

    it 'should yield {0, "-", :dead} for dead cell' do
      cell_dead.to_i.should eq 0
      cell_dead.to_s.should eq '-'
      cell_dead.to_sym.should eq :dead
    end
  end
end