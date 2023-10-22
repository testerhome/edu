module Testerhome::Edu::Admin
  class TrainingCoursesController < ::Admin::ApplicationController
    layout 'layouts/testerhome/edu/admin'
    before_action :set_training_course, only: [:undestroy, :show, :edit,:update, :suggest, :unsuggest, :publish, :unpublish]
    def index
      training_courses_scope = TrainingCourse.unscoped
      @training_courses = training_courses_scope.order('created_at desc, id desc').page(params[:page]).per(10)
    end

    def new
      @training_course = TrainingCourse.new
    end

    def create
      @training_course = TrainingCourse.new(training_course_params)
      if @training_course.save
        redirect_to(admin_training_courses_path, notice: "课程创建成功！")
      else
        render action: "new"
      end
    end

    def edit
    end

    def update
      if @training_course.update(params[:training_course].permit!)
        redirect_to(admin_training_courses_path, notice: "更新成功")
      else
        render action: "edit"
      end
    end

    def destroy
      @training_course = TrainingCourse.find_by_id(params[:id])
      @training_course.destroy
      redirect_to admin_training_courses_path
    end

    def undestroy
      @training_course.update_attribute(:deleted_at, nil)
      redirect_to(admin_training_courses_path)
    end

    def suggest
      @training_course.update_attribute(:suggested, 1)
      redirect_to(admin_training_courses_path, notice: "推荐成功")
    end

    def unsuggest
      @training_course.update_attribute(:suggested, 0)
      redirect_to(admin_training_courses_path, notice: "取消推荐成功")
    end

    def publish
      @training_course.update_attribute(:published, 1)
      redirect_to(admin_training_courses_path, notice: "发布成功")
    end

    def unpublish
      @training_course.update_attribute(:published, 0)
      redirect_to(admin_training_courses_path, notice: "下架成功")
    end

    protected

    def training_course_params
      params.require(:training_course).permit(:cover, :title, :author, :description, :courseType, :price, :published, :suggested, :courseUrlOfXiaoETong)
    end

    def set_training_course
      @training_course = TrainingCourse.unscoped.find_by_id!(params[:id])
    end
  end
end
