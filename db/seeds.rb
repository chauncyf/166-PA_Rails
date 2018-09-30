# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# file = open('db/pa_rails_json/course.json')
# json = JSON.parse(file.read)
#
# json.each do |row|
#   Course.create(name: row['name'], code: row['code'], description: row['description'])
#   puts Course.all
#   end

file = open('db/pa_rails_json/instructor.json')
json = JSON.parse(file.read)

json.each do |row|
  Instructor.create(first: row['first'], middle: row['middle'], last: row['last'], email: row['email'], id: row['id'])
  # puts Course.all
end

# Course.all.each do |i|
#   puts i.name, i.code
# end