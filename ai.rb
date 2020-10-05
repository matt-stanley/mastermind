require_relative 'util'

class AI
  def initialize
    @possibilities = Util.possibilities
    @solution_set = @possibilities
    @current_guess = [1, 1, 2, 2]
  end

  def make_guess
    @possibilities.remove(@current_guess)
    @current_guess
  end

  def generate_guess(response)
    eliminate_solutions(response)
    @current_guess = 

  def eliminate_solutions(response)
    @solution_set.each do |solution|
      unless Util.compare(@current_guess, solution) == response
        puts "AI removing solution #{solution}"
        @solution_set.remove(solution)
      end
    end
  end

  def minmax
    comparisons = Hash.new(0)
    maxes = 
    @possibilities.each do |possibility|
      @solution_set.each do |solution|
        response = Util.compare(possibility, solution)
        comparisons[response] += 1
      end
    end
    

end
