require_relative 'util'
require_relative 'code'
require_relative 'ai'



## If player is breaker

# code = Code.new(false)
# won = false

# until won
#   puts "\nThe computer has created a secret code."
#   print "\nYour guess:\t"
#   guess = gets.chomp.split('').map(&:to_i)
#   puts "\n"
#   comparison = code.compare(guess)

#   puts "Black pegs: #{comparison['black']}"
#   puts "White pegs: #{comparison['white']}"

#   if comparison['black'] == 4
#     won = true
#   end
# end

# puts "You won! Now bugger off."
perfect = {
  'black' => 4,
  'white' => 0
}
code = Code.new(true).code
puts "\nThe computer is thinking..."
ai = AI.new
response = {}

until response == perfect
  ai_guess = ai.make_guess
  puts "AI guesses #{ai_guess.join}"
  response = Util.compare(ai_guess, code)
  if response != perfect
    puts response.to_s
    puts "\nThe computer is thinking..."
    ai.generate_guess(response)
  end
end

