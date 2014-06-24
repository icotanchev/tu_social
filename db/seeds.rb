# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
print 'Creating Student profile... '
User.where(email: 'icotanchev@yahoo.com').delete_all
User.create!(
  email: 'icotanchev@yahoo.com',
  first_name: 'Hristo',
  last_name: 'Tanchev',
  password: 'Test1234!!!!',
  faculty_number: '121210169',
  pin: '9102123046',
  role: 'student',
  send_emails: true)
puts 'done!'

print 'Creating Professor profile... '
User.where(email: 'icotanchev91@gmail.com').delete_all
user = User.create!(
										email: 'icotanchev91@gmail.com',
									  first_name: 'Hristo',
									  last_name: 'Tanchev',
									  password: 'Test1234!!!!',
                    role: '1',
									  send_emails: true)

puts 'done!'