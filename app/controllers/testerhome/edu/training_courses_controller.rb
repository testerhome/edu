module Testerhome::Edu
  class TrainingCoursesController < Testerhome::Edu::ApplicationController
    before_action :set_training_course, only: [:show, :edit, :update, :destroy]

    def index
      training_courses_scope = TrainingCourse.all.published
      @suggested_courses = training_courses_scope.suggested.limit(10)
      @training_courses = training_courses_scope.order('created_at desc, id desc').page(params[:page]).per(10)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_training_course
        @training_course = TrainingCourse.find(params[:id])
      end
      def training_course_params
        params.require(:training_course).permit(:title, :author, :description, :price, :courseType, :draft)
      end
  end
end
