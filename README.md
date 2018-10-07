# PA Rails

Hi, this is a course assignment repository for COSI 166b.

## GitHub
https://github.com/chauncyf/course_catalog

## Heroku
 https://chenfeng-pa-rails.herokuapp.com/


## Things you may want to cover:

* Author - [Chenfeng Fan](fanc@brandeis.edu)

* Ruby version - 2.5.1 

* Rails version - 5.2.1

* Activerecord-import Sample
  ``` ruby
    subject_data = []
    subject_column = [:name, :abbreviation, :id]
    subject_json = JSON.parse(open('db/pa_rails_json/subject.json').read)

    subject_json.each do |row|
        subject_data << {name: row['name'], abbreviation: row['abbreviation'], id: row['id']}
    end
    Subject.import(subject_column, subject_data, validate: false)
  ```

* Bootstrap Tabs Sample
  ``` html
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" href="#">Active</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
            <a class="nav-link disabled" href="#">Disabled</a>
        </li>
    </ul>
  ```
