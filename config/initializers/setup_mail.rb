if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '587',
    authentication: :plain,
    user_name:      "app23141022@heroku.com",
    password:       "tnchzher",
    domain:         'heroku.com',
    enable_starttls_auto: true
  }
end