task :server, [:port] do |task, args|
  port = args.first || "8080"

  system("rackup -p #{port}")
end
