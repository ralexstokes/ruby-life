require_relative '../lib/ruby-life'

BLINKER_TEST_FILE = 'examples/blinker.json'
BLINKER_SAVE_FILE = './spec/test.save.json'

describe Grid do
  let(:test_file) { File.open(BLINKER_TEST_FILE) }
  let(:output_file) { File.open(BLINKER_SAVE_FILE, 'w') }
  let(:grid) { Grid.new }

  describe "loads initial state" do
    it 'should load a JSON file and return its hash' do
      input_hash = grid.load(test_file)
      expect(input_hash.class).to eq Hash
    end

    it 'should turn each entry in the input hash into a Cell object' do
      input_hash = grid.load(test_file)
      grid.make_cells input_hash
      grid.state.each do |row|
        row.each do |cell|
          expect(cell.class).to eq Cell
        end
      end
    end
  end

  describe "saves state" do
    it 'should save the state of the game' do
      another_grid = Grid.new(test_file)
      another_grid.save(output_file)
      expect(`cat #{BLINKER_SAVE_FILE}`).to eq(`cat #{BLINKER_TEST_FILE}`)
    end
  end

  describe "#pads_boundaries!" do
    it 'should have a perimeter of dead cells' do

    end
  end
end
