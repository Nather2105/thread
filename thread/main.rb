require_relative 'init'

# ThreadApp.config

# ThreadApp.print do |name_var, value_var|
#     puts "#{name_var}: #{value_var}"
# end
# ThreadApp.print1 do |name_var, value_var|
#     puts "#{name_var}: #{value_var}"
# end

params = {:name => 'petya', :count => 10}

p params.class

ThreadApp.set(params)

ThreadApp.print1 do |name_var, value_var|
    puts "#{name_var}: #{value_var}"
end

ThreadApp.print1

thread1 = ThreadApp.new
thread1.print1(params)
# thread1.delete
# thread1.update
