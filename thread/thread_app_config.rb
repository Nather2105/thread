module ThreadEx
    class ThreadApp
      class << self
        attr_accessor :md, :html, :ext, :threads, :callable
        
        def config(params = {})
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

      end
    end
end
  