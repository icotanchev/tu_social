# -*- coding: utf-8 -*-
namespace :uiss do
  require 'mechanize'

  task :marks => :environment do 
    $marks_array = []

    a = Mechanize.new
    a.get('http://student.tu-sofia.bg/') do |login_page|
      
      login_page.form_with(name: 'studlogin') do |form|
        form.field_with(id: 'egn').value = '9102123046'
        form.field_with(id: 'fn').value = '121210169'
        login_page = a.submit(form, form.button_with(id: 'login'))
        
        marks = a.click(login_page.link_with(:text => /Оценки/))

        content =  Nokogiri::HTML(marks.body)

        content.css('.list_table').each do |f|
          $marks_array << f
          puts f.content
        end
      end
    end
  end

  # private

  # def take_marks(egn, fn)    
  #   marks_array = []

  #   a = Mechanize.new
  #   a.get('http://student.tu-sofia.bg/') do |login_page|
  
  #     login_page.form_with(name: 'studlogin') do |form|
  #       form.field_with(id: 'egn').value = egn.to_s
  #       form.field_with(id: 'fn').value = fn.to_s
  #       login_page = a.submit(form, form.button_with(id: 'login'))
  
  #       marks = a.click(login_page.link_with(:text => /Оценки/))

  #       content =  Nokogiri::HTML(marks.body)

  #       content.css('.list_table').each do |f|
  #         marks_array << f
  #       end
  #     end
  #   end
  #   binding.pry
  # end
end
