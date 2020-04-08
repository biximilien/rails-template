def apply_template!

  add_template_repository_to_source_path

  # Authentication
  if yes?('Install `devise`? [Y/n]')

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
  if yes?('Install `cancancan`? [Y/n]')

    # Add cancancan to Gemfile
    gem 'cancancan'

    # Run Cancan generators
    generate 'cancan:ability'
  end

  apply 'app/template.rb'

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
end

require "fileutils"
require "shellwords"

# Taken from https://github.com/mattbrictson/rails-template/blob/master/template.rb
#
# Add this template directory to source_paths so that Thor actions like
# copy_file and template resolve against our source files. If this file was
# invoked remotely via HTTP, that means the files are not present locally.
# In that case, use `git clone` to download them to a local temporary dir.
def add_template_repository_to_source_path
  if __FILE__ =~ %r{\Ahttps?://}
    require "tmpdir"
    source_paths.unshift(tempdir = Dir.mktmpdir("rails-template-"))
    at_exit { FileUtils.remove_entry(tempdir) }
    git clone: [
      "--quiet",
      "https://github.com/biximilien/rails-template.git",
      tempdir
    ].map(&:shellescape).join(" ")

    if (branch = __FILE__[%r{rails-template/(.+)/template.rb}, 1])
      Dir.chdir(tempdir) { git checkout: branch }
    end
  else
    source_paths.unshift(File.dirname(__FILE__))
  end
end

apply_template!
