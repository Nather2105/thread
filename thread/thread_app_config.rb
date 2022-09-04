module ThreadEx
    class ThreadApp
      class << self
        attr_accessor :md, :html, :ext, :threads, :callable
        REQUIRE_LIBS = [
          "pathname",
          "kramdown"
        ]


        REQUIRE_RELATIVE_LIBS = [
          "thread_app_config",
          "thread_app_private",
          "thread_app"
         ]
        
        def config(params = {})
          unless @thread_app
            load_require
            load_require_relative            
          end
          @thread_app ||= self 
          
          if block_given?
            yield self
          else
            @md ||= params[:md] || "md"
            @html ||= params[:html] || "html"
            @ext ||= params[:ext] || ".md"
            @threads ||= [] 
            @callable ||= lambda do |file_path, data|
              File.open(file_path, "w:UTF-8") do |f|
                f.write(data)
              end
            end
            print_accessors
          end
        end

        private

        def load_require 
          REQUIRE_LIBS.each do |lib|
            require "#{lib}"
          end
          
        end

        def load_require_relative
          REQUIRE_RELATIVE_LIBS.each do |lib|
            require_relative "#{lib}"
          end
        end

      end
    end
end
  