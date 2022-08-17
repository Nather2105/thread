require_relative 'thread_app'

ThreadApp.config do |app|
    app.md = 'md'
    app.html = 'html' 
    app.ext = 'md'
end