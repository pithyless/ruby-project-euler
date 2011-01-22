require 'set'

MAX = 20
ENDPOINT = [MAX, MAX]

@routes = {}
@routes.default = 0

def route(visited, step, start)
  return nil if visited.include? step

  if ENDPOINT == step
    @routes[start] += 1
    return nil
  end
  
  if @routes.include? step
    @routes[start] += @routes[step]
    return nil
  end
  
  possibles(visited, step)
end

def possibles(visited, step)
  v = visited.dup
  v[step] = nil

  x,y = step
  to_visit = []
  unless x+1 > MAX or visited.include? step
    to_visit << [v, [x+1,y]]
  end
  
  unless y+1 > MAX or visited.include? step
    to_visit << [v, [x,y+1]]
  end
  to_visit
end

def solve
  (MAX-1).downto(0) do |i|
    (MAX-1).downto(0) do |j|
      start = [i,j]
      to_visit = [ [{}, start ] ]
      until to_visit.empty?
        now = to_visit.pop
        ps = route(now[0], now[1], start)
        next if ps.nil?
        ps.each { |v| to_visit << v  }
      end
    end
  end
end

solve
p @routes[[0,0]]