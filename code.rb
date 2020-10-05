require_relative 'util'
class Code
  def initialize(is_maker_human)
    if is_maker_human
      puts 'Please enter 4 digits, 1 - 6, no spaces.'
      puts "Secret Code:\n\n"
      @code = gets.chomp.split('').map(&:to_i)
    else
      @code = Code.generate_code
    end
  end

  def self.generate_code
    code = []
    4.times do
      code.push(rand(1..6))
    end
    code
  end
end
