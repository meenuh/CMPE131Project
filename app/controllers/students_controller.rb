class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    email = @student.email.partition('@').last
    school = School.find_by(domain: email)
    if school
      if @student.save
      @student.school_id = school.id
      @student.save
      StudentMailer.registration_confirmation(@student).deliver

      redirect_to root_url, notice: 'Please confirm your email adress before login'
      else
        render "new"
      end
    else
      flash.now.alert = "Sorry, we dont recognize your email domain"
      render "new"
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def email_activate
  #     self.email_confirmed = true
  #     self.confirm_token = nil
  #     save!(:validate => false)
  # end

  def confirm_email
    student = Student.find_by_confirm_token(params[:id])
    if student
      student.email_confirmed = true
      student.confirm_token = nil
      student.save
      flash[:success] = "Welcome! Your email has been confirmed.
      Please log in to continue."
      redirect_to login_path
    else
      flash[:error] = "Sorry. Student does not exist"
      redirect_to root_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:studentname, :email, :password, :password_confirmation)
    end
end
