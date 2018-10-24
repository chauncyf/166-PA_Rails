# PA Rails
Hi, this is a course assignment repository for COSI 166b.

## GitHub
https://github.com/chauncyf/PA-Rails-3

## Heroku
 https://chenfeng-pa-rails.herokuapp.com/

## Things you may want to cover

* Who am I - [Chenfeng Fan](https://github.com/chauncyf),  <fanc@brandeis.edu>

* Assignment Page - [PA Rails 1](http://cosi166b.s3-website-us-west-2.amazonaws.com/content/topics/pa/pa_rails_1.md/), [PA Rails 2](http://cosi166b.s3-website-us-west-2.amazonaws.com/content/topics/pa/pa_rails_2.md/), [PA Rails 3](http://cosi166b.s3-website-us-west-2.amazonaws.com/content/topics/pa/pa_rails_3.md/)

* Ruby version - 2.5.1 

* Rails version - 5.2.1

### PA Rails 1

* Change db from SQLite to Postgres - [Running Rails on Postgres](https://devcenter.heroku.com/articles/sqlite3#running-rails-on-postgres)

* Data Schema
  ```ruby
    create_table "courses", force: :cascade do |t|
        t.string "name"
        t.string "code"
        t.text "description"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
    end

    create_table "instructors", id: false, force: :cascade do |t|
        t.string "first"
        t.string "middle"
        t.string "last"
        t.string "email"
        t.integer "id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
    end

    create_table "subjects", id: false, force: :cascade do |t|
        t.string "name"
        t.string "abbreviation"
        t.string "id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
    end
  ```

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
  
### PA Rails 2

* A fresh start for db  
    Delete the entire contents on your db and recreate the schema from your schema.rb file, without having to apply all migrations one by one.
    ```
    $ rails db:schema:load
    ``` 
    
* Require Login
    ``` ruby
    before_action :require_login
        include ApplicationHelper
        def require_login
          if !logged_in?
            redirect_to login_path
          end
        end
    ```

* Form_tag & Collection_select 
    ``` erb
    <%= form_tag(search_result_path, method: "get") do %>
      <%= label_tag(:subject_search, "Subject:") %>
      <%= collection_select(:subject, :subject_id, Subject.all, :id, :name, prompt: "Select Subject") %>
    
      <%= label_tag(:course_name_search, "Name:") %>
      <%= text_field_tag(:course_name) %>
    
      <%= submit_tag("Search", class: 'btn btn-primary') %>
    <% end %>
    ```

* ActiveRecord Course Search
    ``` ruby
     def result
        @enrollments = Enrollment.all
        @course_query = params[:course_name]
        @subject = params[:subject][:subject_id]
        
        if @subject.size.equal?(0)
          @courses = Course.where('lower(name) LIKE ?', "%#{@course_query.downcase}%")
        else
          @subject_name = Subject.find_by(id: @subject).name
          @courses = Course.joins(:subjects).where('lower(courses.name) LIKE ? AND subjects.id = ?', "%#{@course_query.downcase}%", @subject)
        end
        @result_sum = @courses.size
    
        render 'show'
      end
    ```   
   
* Enroll Button
    ``` erb
    <%= link_to 'Enroll', "/enroll/#{course.id}", class: 'btn btn-primary', method: :post %>
    ```
 
* Course Enroll
    ``` ruby
    def enroll
        if Enrollment.where(user_id: current_user.id, course_id: params[:course_id]).size >= 1
          flash[:danger] = 'This course is already enrolled'
        else
          Enrollment.create(user_id: current_user.id, course_id: params[:course_id])
          flash[:success] = 'Course enroll success!'
        end
        redirect_to search_path
    end
    ```
    
### PA Rails 3

* [How to render partial on the same page after clicking on link_to with AJAX](https://stackoverflow.com/questions/35899433/how-to-render-partial-on-the-same-page-after-clicking-on-link-to-with-ajax)
