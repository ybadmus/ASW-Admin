Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://mystifying-ride-487431.netlify.app'

    resource '/api/v1/*',
      headers: :any,
      methods: [:get, :post, :options, :patch, :delete], expose: ['X-Total-Count', 'X-Load-More', 'Link']
  end
end
