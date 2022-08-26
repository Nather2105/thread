pr = Proc.new{ puts "hello"}
pr.call

pr = proc{ puts "hello"}
pr.call

pr = proc{ |a, b| puts "a+b = #{a+b}"}
pr.call(2,3,4)
#  не перевіряє кільк. вхідних даних


l = lambda{ |a, b| puts "a+b = #{a+b}"}
l.call(2,3)
#   перевіряє кільк. вхідних даних

l = ->(a,b){puts "a+b = #{a+b}"}
l.call(2,3)

l = lambda do |a,b|
    # a = 3
    # b = 2
    puts "a+b = #{a+b}"
    return a+b
end
pr = proc do |a,b|
    puts "a+b = #{a+b}"
    return a+b
end

def check(mes,cl, *attrs)
    puts "calling check"
    puts "#{mes}" 
    res = cl.call(*attrs)
    puts "res = #{res}"
    puts "finish check"
end

def check1(mes,cl, *attrs)
    puts "calling check1"
    puts "#{mes}" 
    check(mes,cl, *attrs)
    puts "finish check1"
end

# puts "#{self.class}"
# check("lambda",l, 2, 3)
# check1("proc",pr, 2, 3, 4)

def check2(a = 2, b = 3)
    puts "check2 start"
    yield a,b
    puts "check2 finish"
end

check2(&l)
puts "#{l.inspect}"
puts "#{pr.inspect}"