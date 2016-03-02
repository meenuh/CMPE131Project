class StudentMailer < ActionMailer::Base
  # default :from => "test@example.com"

  def registration_confirmation(student)
    @student = student
    mail(:to => "#{student.name} <#{student.email}>", :subject => "Registration Confirmation")
  end
end
