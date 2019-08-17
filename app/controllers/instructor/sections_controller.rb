class Instructor::SectionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @course = Course.find(params[:course_id])
    if @course.user != current_user
      return render plain: 'Unauthorized', status: :unathorized
    end 
    @section = Section.new
  end

  def create
    @course= Course.find(params[:course_id])
    if @course.user != current_user
      return render plain: 'Unauthorized', status: :unathorized
    end
    @section = @course.sections.create(section_params)
    redirect_to instructor_course_path(@course)
  end

  private

  def section_params
    params.require(:section).permit(:title)
  end
end
