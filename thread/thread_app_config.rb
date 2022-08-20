module ThreadEx
    class ThreadApp
      class << self
        attr_accessor :md, :html, :ext, :threads
        
        def config(params = {})
          if block_given?
            yield self
          else
            @md ||= params[:md] || "md"
            @html ||= params[:html] || "html"
            @ext ||= params[:ext] || ".md"
            @threads ||= [] 
            print_accessors
          end
        end

      end
    end
end
  