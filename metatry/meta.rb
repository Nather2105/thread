class Meta
  def initialize
  end

  class << self
    def new_attr_accessor(*params)
      params.each do |param|
        self.class.class_exec do
          define_method("#{param}=") do |v|
            instance_variable_set("@#{param}", v)
          end
          define_method("#{param}") do
            instance_variable_get("@#{param}")
          end
          # self.class.class_exec do
          #     attr_accessor(param)
          # end
          # self.instance_variable_set("@#{param}", val)
        end
      end
    end

    def new_method(name)
      self.class.class_exec do
        define_method(name) do |params = {}|
          yield
        end
      end
    end
  end
end
