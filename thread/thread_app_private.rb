module ThreadEx
  class ThreadApp
    class << self
      private

      def do_thread(&block)
        # якесь повідомлення
        @threads << Thread.new do 
            block.call
            # puts l
            puts "class is #{block.class}"
            puts Thread.current[:name] = "success"
        end 
        # чи можна розширити блок який нам передають додатковим функціоналом
      end

      def do_convert(file)
        data = File.read(file)
        Kramdown::Document.new(data).to_html
      end

      # def save(file_path, data)
      #   File.open(file_path, "w:UTF-8") do |f|
      #     f.write(data)
      #   end
      # end
      def save(file_path, data)
        @callable.call(file_path, data)
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
