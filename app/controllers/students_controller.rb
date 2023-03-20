class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    render json: @student
  end

  def index
    @students = Student.all
    render json: @students
  end

  # Students GET /students with query params returns students whose first or last name matches the query
  def index
    if params[:q]
      @students = Student.where("first_name LIKE :query OR last_name LIKE :query", query: "%#{params[:name]}%")    
    else
      @students = Student.all
    end
    render json: @students
  end
  

end