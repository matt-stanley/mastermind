require_relative 'util'
require 'pp'

class AI
  def initialize
    @possibilities = Util.possibilities
    @solution_set = @possibilities
    @current_guess = [1, 1, 2, 2]
  end

  def make_guess
    @possibilities.delete(@current_guess)
    @current_guess
  end

  def generate_guess(response)
    eliminate_solutions(response)
    minmax
  end

  def eliminate_solutions(response)
    @solution_set.each do |solution|
      unless Util.compare(@current_guess, solution) == response
        # puts "AI removing solution #{solution}"
        @solution_set.delete(solution)
      end
    end
  end

  def minmax
    hit_scores = {}
    @possibilities.each do |possibility|
      hit_scores[possibility] = {}
      @solution_set.each do |solution|
        response = Util.compare(possibility, solution)
        if hit_scores[possibility][response].nil?
          hit_scores[possibility][response] = 1
        else
          hit_scores[possibility][response] += 1
        end
      end
    end

    
  end
end
