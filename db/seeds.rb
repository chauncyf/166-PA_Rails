# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# course_file = open('db/pa_rails_json/course.json')
# course_json = JSON.parse(course_file.read)
# course_json.each do |row|
#   Course.create(name: row['name'], code: row['code'], description: row['description'])
# end

# instructor_file = open('db/pa_rails_json/instructor.json')
# instructor_json = JSON.parse(instructor_file.read)
# instructor_json.each do |row|
#   Instructor.create(first: row['first'], middle: row['middle'], last: row['last'], email: row['email'], id: row['id'])
# end

subject_data = []
subject_column = [:name, :abbreviation, :id]
subject_file = open('db/pa_rails_json/subject.json')
subject_json = JSON.parse(subject_file.read)
subject_json.each do |row|
    subject_data << {name: row['name'], abbreviation: row['abbreviation'], id: row['id']}
end
Subject.import(subject_column, subject_data, validate: false)
