class ContactUsMailer < ApplicationMailer

  def new_email
    @enquiry = params[:enquiry]
    mail(to: "yusif.badmus@gmail.com", subject: "You've got an enquiry on ASW")
  end
end
