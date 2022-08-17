module ThreadEx
  class ThreadApp
    class << self
      attr_accessor :md, :html, :ext

      def initialize
        
      end

      def config
        if block_given?
          yield self
        else
          print_accessors
        end
      end

    end
  end
end
