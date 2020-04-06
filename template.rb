
# Authentication
gem 'devise'

# Install devise
generate 'devise:install'

# Setup action mailer default url options (needed by Devise)
environment 'config.action_mailer.default_url_options = { host: "localhost", port: 5000 }', env: 'development'

# Setup User
generate 'devise User'

# Authorization
gem 'cancancan'

# Foreman
gem 'foreman'

# HAML
gem 'haml'

# RSpec
gem 'rspec-rails', '~> 4.0.0'

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
