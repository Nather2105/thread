arr = 10.times.map do |i|
  Thread.new do 
    Thread.current[:name] = "thread #{i+1}"
    Thread.current[:sleep] = r = rand(5)
    sleep(r)
    puts r
    Thread.current[:result] = rand(10)
  end
end

sleep(10)
puts "program start"

Thread.list.each do |t|
    puts t.inspect 
end

# arr.each do |t|
#     puts "#{t[:name]}: #{t[:sleep]} :#{t[:result]}"
# end
#  arr.each(&:join)
# res = arr.map(&:value)
# p res
# arr.each do |t|
#     puts "#{t[:name]}: #{t[:sleep]} :#{t[:result]}"

# end

# puts "=" * 20 
# Thread.list.each do |t|
#     p t 
# end
