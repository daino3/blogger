path = Rails.root.join('config', 'smtp_settings.yml')
file = YAML.load(File.read(path))

file.each do |key, value|
  ENV[key] = value
end

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "railscasts.com",
  :user_name            => ENV["user_name"],
  :password             => ENV["password"],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

if Rails.env.production?
  # do something else
elsif
  ActionMailer::Base.default_url_options[:host] = "localhost:3000"
end