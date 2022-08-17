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
          @ext ||= params[:ext] || ".md"
          print_accessors
        end
      end

      def converter
        each_file do |file|
          puts "#{file}"
        end
      end

      private

      def each_file
        folder = File.expand_path("#{@md}/*#{@ext}", __dir__)
        Dir.glob(folder) do |f|
          yield f
        end
      end
      def print_accessors
        puts "md = #{@md}"
        puts "html = #{@html}"
        puts "ext = #{@ext}"
      end
    end
  end
end
