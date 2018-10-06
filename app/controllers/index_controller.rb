class IndexController < ApplicationController
  def home
    @courses = Course.all
    @instructors = Instructor.all
  end
end
