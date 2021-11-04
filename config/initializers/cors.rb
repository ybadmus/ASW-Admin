# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://unruffled-ride-f00887.netlify.app', 'https://mystifying-ride-487431.netlify.app', 'https://awutusenyawatch.com', 'http://localhost:3000'


    resource '/*',

             headers: :any,
             methods: %i[get post options patch delete], expose: %w[X-Total-Count X-Load-More Link]

  end
end
