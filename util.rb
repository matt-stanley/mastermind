class Util

  def self.initialize_possibilities
    possibilities = []

    (1..6).each do |i|
      (1..6).each do |j|
        (1..6).each do |k|
          (1..6).each do |m|
            possibilities.push(
              [i, j, k, m]
            )
          end
        end
      end
    end
    possibilities
  end

  @@possibilities = Util.initialize_possibilities

  def self.possibilities
    @@possibilities
  end

  # Compares the guess made to the current code.
  # result stores key => value pairs representing black and white pegs awarded.
  # code_indices_used keeps track of which indices of the code have been used to award a white or black peg.
  # guess_in_code stores all indices that match the current value of guess[i] and have not been used
  #   It is nil if the current value of guess[i] is nowhere in the code.
  # Awards black peg if the value and index match.
  # White peg if the value is in the code, that code index hasn't been used, and the index doesn't match.
  def self.compare(guess, code)
    result = {
      'black' => 0,
      'white' => 0
    }
    code_indices_used = []

    guess.each_with_index do |value, i|
      guess_in_code = Util.check_white_peg(value, code_indices_used, code)
      if value == code[i]
        result['black'] += 1
        code_indices_used.push(i)
      elsif guess_in_code[0]
        result['white'] += 1
        code_indices_used.push(guess_in_code[0])
      end
      guess_in_code.clear
    end

    result
  end

  # Returns all indices in code which match value of a given index in guess.
  # Excludes indices which have already been used (are included in code_indices_used)
  def self.check_white_peg(value, code_indices_used, code)
    # p guess
    # p code_indices_used
    code.each_index.select do |index|
      !code_indices_used.include?(index) && code[index] == value
    end
  end
end
