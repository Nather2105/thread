supports :print1, :delete, :update
class << self
    def supports(*methods)
      puts "supports init"
      methods.each do |method|
        p method
        p self
        define_method method do |params = {}|
          puts "hello #{method}"
          p params
          self.class.send(method, params)
        end
      end
    end
  end
  
  def set(params)
    params.each do |key, value|
      key = "@#{key}".to_sym
      instance_variable_set(key, value)
    end
  end
  
  def print1(params = {})
    if block_given?
      instance_variables.each do |var|
        # yield var, eval(var.to_s)
        yield var.to_s, instance_variable_get(var)
      end
    else
      instance_variables.each do |var|
        puts "#{var} #{instance_variable_get(var)}"
      end
    end
  end

  def print_accessors
    puts @name
    puts @count
  end

end
  