class SessionsController < ApplicationController

  def new
  end

  def create
    student = Student.find_by(email: params[:email])
    if student && student.authenticate(params[:password])
      if user.email_confirmed
        session[:student_id] = student.id
        redirect_to root_url, notice: "Log in successful"
      else
        flash.now.alert = 'Please activate your account by following the 
        instructions in the account confirmation email you received to proceed'
        render "new"
      end
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:student_id] = nil
    redirect_to root_url, notice: "Log out successful!"
  end
end
