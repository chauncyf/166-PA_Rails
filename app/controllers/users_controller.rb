class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    # debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      log_in @user
      flash[:success] = 'Welcome to Course Catalog'
      redirect_to @user
    else
      render 'new'
    end
  end

  def enroll
    if Enrollment.where(user_id: current_user.id, course_id: params[:course_id]).size >= 1
      flash[:danger] = 'This course is already enrolled'
    else
      Enrollment.create(user_id: current_user.id, course_id: params[:course_id])
      flash[:success] = 'Course enroll success!'
    end
    # redirect_to search_path
    redirect_to enrolled_course_path
  end

  def drop
    Enrollment.where(user_id: current_user.id, course_id: params[:course_id]).first.destroy
    flash[:success] = 'Course drop success!'

    redirect_to enrolled_course_path
  end

  def enrolled_course
    @user = current_user
    @courses = current_user.courses.all
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
