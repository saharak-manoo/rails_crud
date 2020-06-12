class StudentsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: { data: Student.all }, status: 200 # or status: :ok, status: 'ok'
  end

  def create
    render json: { data: Student.create(student_params) }, status: 201
    # หรือ แบบนี้ก็ได้ครับ
    # student = Student.new(student_params)
    # student.save
  end

  def show
    student = Student.find_by(id: params[:id])
    if student.present?
      render json: { data: Student.find_by(id: params[:id]) }, status: 200
    else
      render json: { error: 'ไม่มีนักเรียนเลขที่คุณต้องการ' }, status: 400
    end
  end

  def update
    student = Student.find_by(id: params[:id])
    student.update(student_params)

    render json: { data: student }, status: 200
  end

  private

  def student_params
    params.require(:student).permit(:name, :age)
  end
end
