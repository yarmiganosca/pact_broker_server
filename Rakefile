task :server, [:port] do |task, args|
  port = args[:port] || 8080

  system("rackup -p #{port}")
end
