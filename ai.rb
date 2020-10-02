require_relative 'code'

class AI
  def initialize
    @possibilities = AI.initialize_possibilities
    @set_remaining = @possibilities
  end

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

  def initial_guess
    [1, 1, 2, 2]
  end

  def eliminate_solutions(code, response)
    @set_remaining.each do |guess|
      unless code.compare(guess) == response
        @set_remaining.remove(guess)
      end
    end
  end
end
