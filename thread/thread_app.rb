require "pathname"
require_relative "thread_app_config"

module ThreadEx
  class ThreadApp
    class << self
      def converter
        each_file do |file|
          file_name = file.basename(@ext)
          puts "#{file} #{file.basename} #{file.basename(@ext)} #{file_name}"
          # p file
          html_file_path = File.expand_path("#{@html}/#{file_name}.html", __dir__)
          save(html_file_path, html_file_path)
        end
      end

      private

      def save(file_path, data)
        File.open(file_path, "w:UTF-8") do |f|
          f.write(data)
        end
      end

      def each_file
        files_mask = File.expand_path("#{@md}/*#{@ext}", __dir__)
        Dir.glob(files_mask) do |f|
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
