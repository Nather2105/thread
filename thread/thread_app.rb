module ThreadEx
  class ThreadApp
    class << self
      attr_accessor :md, :html, :ext

      def initialize
      end

      def config(params = {})
        if block_given?
          yield self
        else
          @md ||= params[:md] || "md"
          @html ||= params[:html] || "html"
          @ext ||= params[:ext] || "ext"
          print_accessors
        end
      end

      private

      def print_accessors
        puts "md = #{@md}"
        puts "html = #{@html}"
        puts "ext = #{@ext}"
      end
    end
  end
end
