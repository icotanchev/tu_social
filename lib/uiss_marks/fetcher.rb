require 'mechanize'

module UissMarks
	class Fetcher
	
		def initialize(pin, faculty_number)
			@pin = pin
			@faculty_number = faculty_number
		end

		def fetch!
			@hash = {}

			a = Mechanize.new
			a.get('http://student.tu-sofia.bg/') do |login_page|
			  
			  login_page.form_with(name: 'studlogin') do |form|
			    form.field_with(id: 'egn').value = @pin
			    form.field_with(id: 'fn').value = @faculty_number
			    login_page = a.submit(form, form.button_with(id: 'login'))
			    
			    return 'Error: can not download marks' if login_page.uri.to_s != "http://student.tu-sofia.bg/info.php"

			    marks = a.click(login_page.link_with(:text => /Оценки/))

			    content =  Nokogiri::HTML(marks.body)
			    
			    row = 0
			    
			    content.css('.list_table').search('tr').each do |f| 
			      row += 1
			      arr = []

			      f.search('td').each do |td|
			        arr << td.text.strip.gsub(/\s+/, " ") 
			        @hash[row] = arr
			      end
			    end
			  end
			end

			return @hash
		end
	end
end
