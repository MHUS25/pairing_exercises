class Scrabble
  def initialize(word, multiplier, letter_multiplier)
    @word = word
    @multiplier = multiplier
    @letter_multiplier = letter_multiplier
  end
  def score
    letter_scores = {
    "A" => 1,
    "E" => 1,
    "I" => 1,
    "O" => 1,
    "U" => 1,
    "L" => 1,
    "N" => 1,
    "R" => 1,
    "S"=> 1,
    "T" => 1,
    "D" => 2,
    "G" => 2,
    "B" => 3,
    "C" => 3,
    "M" => 3,
    "P" => 3,
    "F" => 4,
    "H" => 4,
    "V" => 4,
    "W" => 4,
    "Y" => 4,
    "K" => 5,
    "J" => 8,
    "X" =>	8,
    "Q" => 10,
    "Z" => 10,
    " " => 0,
    "\t" => 0,
    "\n" => 0
     }
    return 0 if @word == "" || @word == " " || @word.nil?
    word_score = 0
    @word.upcase.split('').each.with_index do |letter, index|
      word_score +=  ( letter_scores[letter] * @letter_multiplier[index] )
    end
    if @multiplier == 'double'
      word_score *= 2
    elsif @multiplier == 'triple'
      word_score *=3
    end
    word_score
  end
end
