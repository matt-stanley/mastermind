require_relative 'code'
require_relative 'ai'
require_relative 'util'


## If player is breaker

code = Code.new(false)
won = false

until won
  puts "\nThe computer has created a secret code."
  print "\nYour guess:\t"
  guess = gets.chomp.split('').map(&:to_i)
  puts "\n"
  comparison = code.compare(guess)

  puts "Black pegs: #{comparison['black']}"
  puts "White pegs: #{comparison['white']}"

  if comparison['black'] == 4
    won = true
  end
end

puts "You won! Now bugger off."