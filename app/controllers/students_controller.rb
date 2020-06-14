class StudentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :load_student, only: [:edit, :update, :show, :destory, :add_course] # only ก็คือจะทำเฉพาะ action ที่เรากำหนดไว้

  def index
    render json: { data: Student.all.as_json({ api: true }) }, status: 200 # or status: :ok, status: 'ok'
  end

  def create
    student = Student.new(student_params)
    if student.save
      render json: { data: student.as_json({ api: true }) }, status: 201
    else
      render json: { error: student&.errors&.full_messages&.to_sentence }, status: 400
    end
  end

  def show
    if @student.present?
      render json: { data: Student.find_by(id: params[:id]).as_json({ api: true }) }, status: 200
    else
      render json: { error: 'ไม่มีนักเรียนเลขที่คุณต้องการ' }, status: 400
    end
  end

  def update
    render json: { data: @student.update(student_params).as_json({ api: true }) }, status: 200
  end

  def destroy
    @student.destroy

    render json: { message: 'ลบนักเรียนสำเร็จ' }, status: 200
  end

  def add_course
    student_course = @student.student_courses.new(student_course_params)
    ap student_course

    if student_course.save
      render json: { data: @student.as_json({ api: true }) }, status: 201
    else
      render json: { error: student_course&.errors&.full_messages&.to_sentence }, status: 400
    end
  end

  private

  def load_student
    @student ||= Student.find_by(id: params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :age, :gender_id)
  end

  def student_course_params
    params.require(:student_course).permit(:course_id)
  end
end
