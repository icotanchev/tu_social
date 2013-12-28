# -*- coding: utf-8 -*-
#namespace :uiss do
require 'mechanize'
#  task :ipg, [:days] => :environment do |task, args|
task :marks => :environment do#, [:egn, :fac_num] do |task, args|
  puts 'RAKE TASK'

  ARGV.shift

  # Use the arguments
  puts ARGV.first
  puts '===='
  puts ARGV.last

  $marks_array = []

  a = Mechanize.new
  a.get('http://student.tu-sofia.bg/') do |login_page|
    
    login_page.form_with(name: 'studlogin') do |form|
      form.field_with(id: 'egn').value = ARGV.first
      form.field_with(id: 'fn').value = ARGV.last
      login_page = a.submit(form, form.button_with(id: 'login'))
      
      marks = a.click(login_page.link_with(:text => /Оценки/))

      content =  Nokogiri::HTML(marks.body)
      
      content.css('.list_table').each do |f|
        $marks_array << f
        puts f.content
        puts '\n'
      end
    end
  end
end
#end
