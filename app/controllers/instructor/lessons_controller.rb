class Instructor::LessonsController < ApplicationController
  before_action :authenticate_user!

  def new
    @section = Section.find(params[:section_id])
      if @section.course.user != current_user
        return render plain: 'Unauthorized', status: :unathorized
      end
    @lesson = Lesson.new
  end

  def create
    @section = Section.find(params[:section_id])
    if @section.course.user != current_user
      return render plain: 'Unauthorized', status: :unathorized
    end  
    @lesson = @section.lessons.create(lesson_params)
    redirect_to instructor_course_path(@section.course)
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle)
  end
end
