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
    @subjects = Subject.all

  end

  def result
    @enrollments = Enrollment.all
    @course_query = params[:course_name]
    @subject = params[:subject][:subject_id]
    # @course = Course.find_by(code: params[:course_name])
    if @subject.size.equal?(0)
      @courses = Course.where('lower(name) LIKE ?', "%#{@course_query.downcase}%")
    else
      # @courses = Course.where('lower(name) LIKE ?', "%#{@search.downcase}%").subjects.all
      @subject_name = Subject.find_by(id: @subject).name
      @courses = Course.joins(:subjects).where('lower(courses.name) LIKE ? AND subjects.id = ?', "%#{@course_query.downcase}%", @subject)

      puts "!!!!!!!#{@courses.size}"
    end
    @result_sum = @courses.size

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
