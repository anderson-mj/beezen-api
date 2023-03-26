
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
      origins '*' # change this to your domain
      resource '/api/*', headers: :any, methods: [:get, :post] # only allow GET (to show alerts) and POST (to create alerts) on API endpoints
  end
end