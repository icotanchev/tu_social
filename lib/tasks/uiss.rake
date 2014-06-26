require 'mechanize'

task :marks => :environment do
  UissMarks::MarksConfigurator.new(ARGV.shift.first).configure_marks
end
