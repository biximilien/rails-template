
# Authentication
if yes?('Install `devise` ?')

  # Add devise to Gemfile
  gem 'devise'

  # Run Devise generators
  generate 'devise:install'

  # Get the `User` model name
  model_name = ask('What is the user model? [User]')
  model_name = 'User' if model_name.blank?

  # Setup action mailer default url options (needed by Devise)
  environment 'config.action_mailer.default_url_options = { host: "localhost", port: 5000 }', env: 'development'

  # Run Devise User generators
  generate 'devise', model_name
end

# Authorization
if yes?('Install `cancancan` ?')

  # Add cancancan to Gemfile
  gem 'cancancan'

  # Run Cancan generators
  generate 'cancan:ability'
end

# Foreman
gem 'foreman'

# HAML
gem 'haml'

# RSpec
gem_group :development, :test do
  gem 'rspec-rails', '~> 4.0.0'
end

# bulma CSS framework
run "yarn add bulma"

# FontAwesome
run "yarn add @fortawesome/fontawesome-free"

# Setup database
rails_command "db:create"
rails_command "db:migrate"

# Generate a static pages controller with a home page
generate(:controller, "pages home")

# Add root route
route "root to: 'pages#home'"

# Generate a Procfile for `foreman` and Heroku
file 'Procfile', <<~PROCFILE
  web: bundle exec puma -C config/puma.rb
PROCFILE

# Setup Git and first commit
after_bundle do
  git :init
  git add: '.'
  git commit: '-a -m "feat: Initial commit" -m "Initial commit with Ruby on Rails application template from biximilien/rails-template 🚀"'
end
