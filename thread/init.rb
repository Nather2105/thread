require_relative "thread_app_config"

thread = ThreadEx::ThreadApp

thread.config do |app|
  app.md = "md"
  app.html = "html"
  app.ext = ".md"
  app.callable = lambda do |file_path, data|
    File.open(file_path, "w:UTF-8") do |f|
      f.write(data)
    end
  end
end
