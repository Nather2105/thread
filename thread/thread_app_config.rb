module ThreadEx
    class ThreadApp
      class << self
        attr_accessor :md, :html, :ext

        
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

      end
    end
end
  