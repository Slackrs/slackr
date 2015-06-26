class NotificationMailer < ApplicationMailer

	default from: 'no-reply@example.com',
          return_path: 'system@example.com'

  def alert_troubled_student(student)
    @student = student

    mail(from: student.cohort.prodecer.email, to: student.email, subject: "Alert! You Have Excessive Absences!")
  end

end
