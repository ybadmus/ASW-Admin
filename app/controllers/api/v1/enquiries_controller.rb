class API::V1::EnquiriesController < API::V1::APIController

  def create
    enquiry = Enquiry.new(enquiry_params)
    ContactUsMailer.with(enquiry: enquiry).new_email.deliver_now
  end

  private

    def enquiry_params
      params.require(:enquiry).permit(:name, :message, :email, :phone, :subject)
    end
end
