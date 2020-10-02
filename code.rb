class Code
  def initialize(is_maker_human)
    if is_maker_human
      # prompt for code
    else
      @code = Code.generate_code
    end
  end

  def self.generate_code
    code = []
    (0..3).each do
      code.push(rand(1..6))
    end

    code
  end

  # Compares the guess made to the current code.
  # result stores key => value pairs representing black and white pegs awarded.
  # code_indices_used keeps track of which indices of the code have been used to award a white or black peg.
  # guess_in_code stores all indices that match the current value of guess[i] and have not been used
  #   It is nil if the current value of guess[i] is nowhere in the code.
  # Awards black peg if the value and index match.
  # White peg if the value is in the code, that code index hasn't been used, and the index doesn't match.
  def compare(guess)
    result = {
      'black' => 0,
      'white' => 0
    }
    code_indices_used = []

    guess.each_with_index do |value, i|
      guess_in_code = check_white_peg(value, code_indices_used)
      if value == @code[i]
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
  def check_white_peg(value, code_indices_used)
    # p guess
    # p code_indices_used
    @code.each_index.select do |index|
      !code_indices_used.include?(index) && @code[index] == value
    end
  end
end
