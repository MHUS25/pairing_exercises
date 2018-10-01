require 'scrabble'

RSpec.describe Scrabble do
  context 'standard specs' do
    it 'returns 0 for empty words' do
      scrabble = Scrabble.new('', '', [])

      expect(scrabble.score).to eq 0
    end

    it 'returns 0 for whitespace' do
      scrabble = Scrabble.new(" \t\n", '', [1,1,1])

      expect(scrabble.score).to eq 0
    end

    it 'returns 0 for nil' do
      scrabble = Scrabble.new(nil, '', [])

      expect(scrabble.score).to eq 0
    end

    it 'scores short word' do
      scrabble = Scrabble.new('a', '', [1])

      expect(scrabble.score).to eq 1
    end

    it 'scores short word' do
      scrabble = Scrabble.new('f', '', [1])

      expect(scrabble.score).to eq 4
    end
  end

  context 'further specs' do
    it 'scores a simple word' do
      scrabble = Scrabble.new('street', '', [1,1,1,1,1,1])

      expect(scrabble.score).to eq 6
    end

    it 'scores a more complicated word' do
      scrabble = Scrabble.new('quirky', '', [1,1,1,1,1,1])

      expect(scrabble.score).to eq 22
    end

    it 'scores a case-insensitive word' do
      scrabble = Scrabble.new('OXYPHENBUTAZONE', '', [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])

      expect(scrabble.score).to eq 41
    end
  end

  context 'further further specs' do
    it 'scores a simple word' do
      scrabble = Scrabble.new('street', 'double', [1,1,1,1,1,1])

      expect(scrabble.score).to eq 12
    end

    it 'scores a more complicated word' do
      scrabble = Scrabble.new('quirky', 'double', [1,1,1,1,1,1])

      expect(scrabble.score).to eq 44
    end

    it 'scores a case-insensitive word' do
      scrabble = Scrabble.new('OXYPHENBUTAZONE', 'triple', [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])

      expect(scrabble.score).to eq 123
    end
  end

  context 'further further further specs' do
    it 'scores a simple word' do
      scrabble = Scrabble.new('street', 'double', [1,1,1,2,1,1])

      expect(scrabble.score).to eq 14
    end

    it 'scores a more complicated word' do
      scrabble = Scrabble.new('quirky', 'double', [1,2,3,1,1,1])

      expect(scrabble.score).to eq 50
    end

    it 'scores a case-insensitive word' do
      scrabble = Scrabble.new('OXYPHENBUTAZONE', 'triple', [3,1,1,1,1,1,1,1,1,1,1,1,1,1,1])

      expect(scrabble.score).to eq 129
    end
  end
end
