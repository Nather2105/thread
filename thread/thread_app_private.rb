module ThreadEx
  class ThreadApp
    class << self
      private

      def do_thread(&block)
        # якесь повідомлення
        @threads << Thread.new(&block) #do
        #     puts Thread.current[:name] = "thread #{i+1}"
        # end
        # чи можна розширити блок який нам передають додатковим функціоналом
      end

      def do_convert(file)
        data = File.read(file)
        Kramdown::Document.new(data).to_html
      end

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
