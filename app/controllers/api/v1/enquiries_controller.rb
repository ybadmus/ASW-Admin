class API::V1::EnquiriesController < API::V1::APIController

  def create
    enquiry = Enquiry.new(enquiry_params)
    begin
      ContactUsMailer.with(enquiry: enquiry).new_email.deliver_now
    rescue StandardError => e
      render :json, status: 500 
    end
    render :json, json: {message: ""}, status: 200 
  end

  private

    def enquiry_params
      params.require(:enquiry).permit(:name, :message, :email, :phone, :subject)
    end
end
