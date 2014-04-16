# War:
# Naomi's score is 
# lightest to heaviest, Ken takes all that he is able to take, or gets rid of lightest.
def war(n, k)
  r = 0
  n.each_with_index do |w, i|
    return r+k.length if w > k[-1]
    j = 0
    while (k[j] < w) do 
      j+=1
    end
    k.delete_at(j)
  end
  #$stderr.puts "War: #{n}, #{k}, SCORE: #{r}"
  return k.length
end
# Deceit: Optimum strategy 
def deceit(n, k)
  #$stderr.puts "Deceit: #{n}, #{k}"
  r = 0
  while (!n.empty?) do
    if n[0] > k[0]
      r += 1
      n.delete_at(0)
      k.delete_at(0)
    else
      n.delete_at(0)
      k.delete_at(-1)
    end
  end
  #$stderr.puts "Deceit: #{n}, #{k}"
  return r
end

def solve(str) # 1 ≤ N ≤ 1000.
  @f.readline #starts with n
  n = @f.readline.strip.split(/\s+/).map(&:to_f)
  k = @f.readline.strip.split(/\s+/).map(&:to_f)
  n.sort!
  k.sort!
  #$stderr.puts "INPUT#{str}: #{n}, #{k}"

  return "#{deceit(n.dup,k.dup)} #{war(n.dup,k.dup)}" #"Case #x: y z" y is the number of points Naomi score if she plays Deceitful War optimally, and z is the number of points Naomi will score if she plays War optimally. 
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
