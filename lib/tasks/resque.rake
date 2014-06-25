require 'resque/tasks'

task 'resque:setup' => :environment do
  puts "setting up resque"
end
