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
    guess_ready = false
    eliminate_solutions(response)
    possible_guesses = minmax
    possible_guesses.each do |guess|
      next unless @solution_set.include?(guess);

      @current_guess = guess
      guess_ready = true
      break
    end
    @current_guess = possible_guesses[0] unless guess_ready
  end

  def eliminate_solutions(response)
    @solution_set.each do |solution|
      unless Util.compare(@current_guess, solution) == response
        @solution_set.delete(solution)
      end
    end
  end

  def minmax
    hit_scores = {}
    max_scores = {}

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

    hit_scores.each do | key, value |
      max_score = get_max(value)
      max_scores[key] = max_score
    end

    get_min(max_scores)
  end

  def get_max(hit_hash)
    max = hit_hash.reduce(0) do | max, (_key, val) |
      val > max ? val : max
    end
    max
  end

  def get_min(scores)
    result = []
    min = scores.values[0]
    scores.each do |key, value|
      if value < min
        result.clear
        min = value
        result.push(key)
      elsif value == min
        result.push(key)
      end 
    end
    result
  end
end
