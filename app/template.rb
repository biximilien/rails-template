# manifest
copy_file "app/assets/config/manifest.js"

# stylesheets
copy_file "app/assets/stylesheets/application.scss"
remove_file "app/assets/stylesheets/application.css"
create_directory "app/assets/stylesheets/pages"
copy_file "app/assets/stylesheets/pages/_home.scss"
copy_file "app/assets/stylesheets/_registrations.scss"
copy_file "app/assets/stylesheets/_sessions.scss"

# controllers
copy_file "app/controllers/pages_controller.rb"

# layouts
copy_file "app/views/layouts/application.haml"
remove_file "app/views/layouts/application.html.erb"
create_directory "app/views/shared"
copy_file "app/viwes/shared/navbar.haml"
copy_file "app/viwes/shared/footer.haml"
copy_file "app/views/layouts/mailer.haml"
remove_file "app/views/layouts/mailer.html.erb"
copy_file "app/views/layouts/mailer.text.haml"
remove_file "app/views/layouts/mailer.text.erb"

# views
create_directory "app/views/pages"
copy_file "app/views/pages/home.haml"

# devise views
create_directory "app/views/devise"

create_directory "app/views/devise/confirmations"
copy_file "app/views/devise/confirmations/new.haml"
remove_file "app/views/devise/confirmations/new.html.erb"

create_directory "app/views/devise/mailer"
copy_file "app/views/devise/mailer/confirmation_instructions.haml"
remove_file "app/views/devise/mailer/confirmation_instructions.html.erb"
copy_file "app/views/devise/mailer/email_changed.haml"
remove_file "app/views/devise/mailer/email_changed.html.erb"
copy_file "app/views/devise/mailer/password_change.haml"
remove_file "app/views/devise/mailer/password_change.html.erb"
copy_file "app/views/devise/mailer/reset_password_instructions.haml"
remove_file "app/views/devise/mailer/reset_password_instructions.html.erb"
copy_file "app/views/devise/mailer/unlock_instructions.haml"
remove_file "app/views/devise/mailer/unlock_instructions.html.erb"

create_directory "app/views/devise/passwords"
copy_file "app/views/devise/passwords/edit.haml"
remove_file "app/views/devise/passwords/edit.html.erb"
copy_file "app/views/devise/passwords/new.haml"
remove_file "app/views/devise/passwords/new.html.erb"

create_directory "app/views/devise/registrations"
copy_file "app/views/devise/registrations/edit.haml"
remove_file "app/views/devise/registrations/edit.html.erb"
copy_file "app/views/devise/registrations/new.haml"
remove_file "app/views/devise/registrations/new.html.erb"

create_directory "app/views/devise/sessions"
copy_file "app/views/devise/sessions/new.haml"
remove_file "app/views/devise/sessions/new.html.erb"

create_directory "app/views/devise/shared"
copy_file "app/views/devise/shared/_error_messages.haml"
remove_file "app/views/devise/shared/_error_messages.html.erb"
copy_file "app/views/devise/shared/_links.haml"
remove_file "app/views/devise/shared/_links.html.erb"

create_directory "app/views/devise/unlocks"
copy_file "app/views/devise/unlocks/new.haml"
remove_file "app/views/devise/unlocks/new.html.erb"
