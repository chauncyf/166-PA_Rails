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
    @course_query = params[:course_name]
    @subject = params[:subject][:subject_id]

    if @subject.size.equal?(0)
      @courses = Course.where('lower(name) LIKE ?', "%#{@course_query.downcase}%")
    else
      @subject_name = Subject.find_by(id: @subject).name
      @courses = Subject.find(@subject).courses.where('lower(name) LIKE ?', "%#{@course_query.downcase}%")
    end
    @result_sum = @courses.size

    render 'show'
  end

  def show
    @course = Course.first

    respond_to do |format|
      format.js { render layout: false } # Add this line to you respond_to block
    end

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
