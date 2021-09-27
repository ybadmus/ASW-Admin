# frozen_string_literal: true

module API
  module V1
    class EnquiriesController < API::V1::APIController
      def create
        enquiry = Enquiry.new(enquiry_params)
        begin
          ContactUsMailer.with(enquiry: enquiry).new_email.deliver_now
        rescue StandardError => e
          return render :json, json: { message: 'Error occured whiles sending enquiry, please try again' }, status: 500
        end
        render :json, json: { message: 'Enquiry sucessfully sent to ASW' }, status: 200
      end

      private

      def enquiry_params
        params.require(:enquiry).permit(:name, :message, :email, :phone, :subject)
      end
    end
  end
end
