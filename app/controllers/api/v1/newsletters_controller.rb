class API::V1::NewslettersController < API::V1::APIController

  def create
    subscriber = Newsletter.new(subscriber_params)

    if subscriber.save
      render json: "User successfully added to subscribers list."
    else
      render json: subscriber.errors.full_messages
    end
  end

  private

    def subscriber_params
      params.require(:newsletter).permit(:ip_address, :email_address)
    end
end