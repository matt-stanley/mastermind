arr = [[0,0][0,1],[0,2],[1,0],[1,1]]
n_arr = (1..3).to_a

weird = Hash.new(Hash.new(0))

arr.each do |i|
  n_arr.each do |j|


    weird[i][j] += 1

  end
end

p weird.keys