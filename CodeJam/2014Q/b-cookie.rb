# 1 ≤ C ≤ 10000.
# 1 ≤ F ≤ 100.
# 1 ≤ X ≤ 100000.
def solve(str)
  c,f,x = @f.readline.strip.split(/\s+/).map(&:to_f)
  s = 0.0 #In this problem, you start with 0 cookies. 
  t = 0.0
  v = 2.0 #current velocity. You gain cookies at a rate of 2 cookies per second
  
  while (x/v > (c/v + x/(v+f))) do #Any time you have at least C cookies, you can buy a cookie farm.
    t += c/v 
    v += f #Every time you buy a cookie farm, it costs you C cookies and gives you an extra F cookies per second. 
  end

  return t+x/v
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
