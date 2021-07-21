class ContactUsMailer < ApplicationMailer
  default from: 'yusif.badmus@gmail.com'

  def new_mail(obj)
    @enquiry = obj
    mail(to: "yusif.badmus@gmail.com", subject: "You've got an enquiry on ASW")
  end
end
