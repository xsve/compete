# def sumline
#   k = @f.readline.strip.to_i
#   a = []
#   a.push []
#   (1..4).each do
#     a.push @f.readline.strip.split(/\s+/).map(&:to_i)
#   end
#   # calculate checksum for row
#   sum = a[k].reduce(0) {|s,v| s|(1<<v) }
#   return sum
# end

def getline
  k = @f.readline.strip.to_i
  a = []
  a.push []
  (1..4).each do
    a.push @f.readline.strip.split(/\s+/).map(&:to_i)
  end
  return a[k] # row of interest
end

def solve(str)
  first, second = [ getline(), getline() ] # get rows

  r = first & second #intersect
  return "Volunteer cheated!" if r.empty?
  return "Bad magician!" if r.length > 1
  return r[0]
end


@f=File.open(ARGV[0] || "input", 'r')
total = @f.readline.to_i
(1..total).each do |i|
  res = solve("#{i}")
  out = 'Case #' + "#{i}: #{res}"
  puts out
  $stderr.puts "------>: #{out}"
end
@f.close
