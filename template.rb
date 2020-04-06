
# Authentication
gem 'devise'

# Authorization
gem 'cancancan'

# Foreman
gem 'foreman'

# HAML
gem 'haml'

# RSpec
gem 'rspec-rails', '~> 4.0.0'


# Setup action mailer default url options (needed by Devise)
environment 'config.action_mailer.default_url_options = { host: "localhost", port: 5000 }', env: 'development'

# Setup database
rails_command "db:create"
rails_command "db:migrate"

# Add root route
route "root to: 'pages#home'"

git :init
git add: '.'
git commit: '-a -m "feat: Initial commit\n\nInitial commit with Ruby on Rails application template from biximilien/rails-template 🚀"'
