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
    @course = Course.find_by(code: params[:course_code])
    render 'show'
  end

  def show
    @course = Course.first
    # @course = Course.find_by(code: params[:course_code])
    # puts "$$$$$$#{params[:course_code]}"
    # @course = Course.find_by(code: "ENVS 97A")
  end

  # def enroll
  #   @enrollments = Enrollment.create(user_id: current_user.id, course_id: params[:course_id])
  #   # puts "!!! #{current_user.id} #{current_user.name}, #{current_user.email}"
  #   # puts :course_id
  #   # puts params[:course_id]
  # end

  # private
  #   def enroll_params
  #     params.require(:course).permit(:name, :email, :password,
  #                                  :password_confirmation)
  #   end
end
