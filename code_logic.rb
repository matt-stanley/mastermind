def generate_code
  code = []
  (0..3).each do |i|
    puts i
    code[i] = rand(1..6)
  end

  code
end

# Compares the guess made to the current code.
# result stores key => value pairs representing black and white pegs awarded
# code_indices_used keeps track of which indices of the code have been used to award a white or black peg
# guess_in_code stores all indices that match the current value of guess[i] and have not been used
#   It is nil if the current value of guess[i] is nowhere in the code.
def compare_code(guess, code)
  result = Hash.new(0)
  code_indices_used = []

  guess.each_with_index do |_value, i|
    guess_in_code = guess_in_code(guess[i], code, code_indices_used)
    if guess[i] == code[i]
      result['black'] += 1
      code_indices_used.push(i)
    elsif 
    end
  end

  result
end

# Returns all indices in code which match value of a given index in guess.
# Excludes indices which have already been used (are included in code_indices_used)
def guess_in_code(guess, code, code_indices_used)
  code.each_index.select { |index|
    !code_indices_used.include?(index) && code[index] == guess }
  end
end
