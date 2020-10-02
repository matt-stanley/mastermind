def initialize_possibilities
  possibilities = []

  (1..6).each do |i|
    (1..6).each do |j|
      (1..6).each do |k|
        (1..6).each do |m|
          possibilities.push(
            i.to_s + j.to_s + k.to_s + m.to_s
          )
        end
      end
    end
  end
end
