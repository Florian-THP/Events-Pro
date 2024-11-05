class EventMailer < ApplicationMailer
  default from: 'triboutflorian@gmail.com'

  def notify_creator(attendance)
    @attendance = attendance
    @event = attendance.event
    @creator = @event.user
    @participant = attendance.user

    mail(to: @creator.email, subject: 'Nouveau participant à votre événement')
  end
end
