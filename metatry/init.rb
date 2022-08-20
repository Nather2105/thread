require_relative 'meta'
 Meta.new
 Meta.new_attr_accessor("cart", "text")
 Meta.cart = 5
 Meta.text = "my score is "

 puts "#{Meta.text} #{Meta.cart}"

 Meta.new_method("test") do 
    puts "hi"
 end
 Meta.test