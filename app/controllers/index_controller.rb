class IndexController < ApplicationController
  # def index
  #   @enrollments = Enrollment.all
  # end

  def home
    @courses = Course.all
    @instructors = Instructor.all
    @subjects = Subject.all
  end

  def create
    # result = Enrollment.find_by()
  end

  def search
    @courses = Course.all

  end

  def result
    @enrollments = Enrollment.all
    @search = params[:course_name]
    # @course = Course.find_by(code: params[:course_name])
    @courses = Course.where('lower(name) LIKE ?', "%#{@search.downcase}%")
    render 'show'
  end

  def show
    @course = Course.first
    # @course = Course.find_by(code: params[:course_code])
    # puts "$$$$$$#{params[:course_code]}"
    # @course = Course.find_by(code: "ENVS 97A")
  end


  # private
  #   def enroll_params
  #     params.require(:course).permit(:name, :email, :password,
  #                                  :password_confirmation)
  #   end
end
