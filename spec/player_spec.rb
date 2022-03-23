require 'player'

describe Player do
  subject(:adam) { Player.new('Adam') }
  subject(:kate) { Player.new('Kate') }

  describe '#name' do
    it 'returns the name' do
      expect(kate.name).to eq 'Kate'
    end
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(kate.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe '#receive_damage' do
    it 'reduces the player hit points' do
      expect { kate.receive_damage }.to change { kate.hit_points }.by(-10)
    end
  end

end