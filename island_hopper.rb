def island_hopper(grid)
  bottom = grid.size
  edge = grid[0].size
  islands = []

  (0..bottom).to_a.each do |vertical|
    (0..edge).each do |horizontal|
      if grid[vertical][horizontal] == "1" && undiscovered?(vertical, horizontal, islands)
        islands += find_water(vertical, horizontal, grid)
      end
    end
  end

  puts "Number of islands: #{islands.size}"
end

def undiscovered?(vertical, horizontal, islands)
  islands.each do |island|
    if island.include?([vertical, horizontal])
      return false
    end
  end
  true
end

def find_water(vertical, horizontal, grid)
  bottom = grid.size
  edge = grid[0].size

  ret = [[vertical, horizontal]]

  next_vert = vertical + 1
  next_hori = horizontal + 1

  # look down
  if next_vert <= bottom && grid[next_vert][horizontal] == "1"
    ret += find_water(next_vert, horizontal, grid)
  end

  #look right
  if next_hori <= edge && grid[vertical][next_hori] == "1"
    ret += find_water(vertical, next_hori, grid)
  end

  ret
end
