class StudentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :load_student

  def index
    render json: { data: Student.all }, status: 200 # or status: :ok, status: 'ok'
  end

  def create
    student = Student.new(student_params)
    if student.save
      render json: { data: student }, status: 201
    else
      render json: { error: student&.errors&.full_messages&.to_sentence }, status: 400
    end
  end

  def show
    if @student.present?
      render json: { data: Student.find_by(id: params[:id]) }, status: 200
    else
      render json: { error: 'ไม่มีนักเรียนเลขที่คุณต้องการ' }, status: 400
    end
  end

  def update
    render json: { data: @student.update(student_params) }, status: 200
  end

  def destroy
    @student.destroy

    render json: { message: 'ลบนักเรียนสำเร็จ' }, status: 200
  end

  private

  def load_student
    @student ||= Student.find_by(id: params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :age)
  end
end
