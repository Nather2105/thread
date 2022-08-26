
module ThreadEx
  class ThreadApp
    class << self
      def converter
        each_file do |file|
          file_name = file.basename(@ext)
          puts "#{file} #{file.basename} #{file.basename(@ext)} #{file_name}"
          # p file
          html_file_path = File.expand_path("#{@html}/#{file_name}.html", __dir__)
          # converted_data = "test" unless defined?(do_convert(file))
          do_thread do
            converted_data = do_convert(file)
            save(html_file_path, converted_data)
            # l = 5
          end 
        end
        @threads.map(&:value)
      end
    end
  end
end
