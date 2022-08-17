require 'pathname'

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
          puts "#{file} #{file.basename} #{file.basename(@ext)}"
          # p file
          name = file.basename(@ext)
          new_file = File.expand_path("#{@html}/#{name}.html", __dir__)
          puts new_file
        end
      end

      private

      def each_file
        folder = File.expand_path("#{@md}/*#{@ext}", __dir__)
        Dir.glob(folder) do |f|
          yield Pathname.new(f)
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
