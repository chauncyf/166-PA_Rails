# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


course_data = []
course_column = [:name, :description, :id]
course_subject_data = []
course_subject_column = [:course_id, :subject_id]
course_json = JSON.parse(open('db/pa_rails_json/course.json').read)
course_json.each do |row|
    course_data << {name: row['name'], description: row['description'], id: row['code']}
    row['subjects'].each do |subject_row|
      course_subject_data << {course_id: row['code'], subject_id: subject_row['id']}
    end
end
Course.import(course_column, course_data, validate: false)
CourseSubject.import(course_subject_column, course_subject_data)


subject_data = []
subject_column = [:name, :abbreviation, :id]
subject_json = JSON.parse(open('db/pa_rails_json/subject.json').read)
subject_json.each do |row|
  subject_data << {name: row['name'], abbreviation: row['abbreviation'], id: row['id']}
end
Subject.import(subject_column, subject_data, validate: false)


instructor_data = []
instructor_column = [:first, :middle, :last, :email, :id]
instructor_json = JSON.parse(open('db/pa_rails_json/instructor.json').read)
instructor_json.each do |row|
  instructor_data << {first: row['first'], middle: row['middle'], last: row['last'], email: row['email'], id: row['id']}
end
Instructor.import(instructor_column, instructor_data, validate: false)
