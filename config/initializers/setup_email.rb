production_smtp_path = Rails.root.join('../../', 'smtp_settings.yml')
local_smtp_path      = Rails.root.join('config', 'smtp_settings.yml')

path = File.exists?(production_smtp_path) ? production_smtp_path : local_smtp_path

file = YAML.load(File.read(path))

file.each do |key, value|
  ENV[key] = value
end

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
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