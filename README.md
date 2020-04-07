# Rails Template 💎

My Ruby on Rails web application boilerplate with my preferred dependencies all
pre-installed. This is great to save time on new projects by installing
everything automagically.

Inspired by and loosely based on Matt Brictson's amazing Ruby on Rails
application template [mattbrictson/rails-template][orig-rails-template]. Have
a look at it!

## How to use

Generate a new application using my template

```sh
rails new AmazingApp \
  -d postgresql \
  -m https://raw.githubusercontent.com/biximilien/rails-template/master/template.rb
```

## Install

Add the following lines to your `~/.railsrc` if you want all your new projects
to source my template.

```sh
-d postgresql
-m https://raw.githubusercontent.com/biximilien/rails-template/master/template.rb
```

## What it includes?

* [Devise][devise-repo]
* [Foreman][foreman-repo]
* RSpec
* [HAML][haml-site]
* [Bulma][bulma-site]
* [FontAwesome][fontawesome-site]

[fontawesome-site][https://fontawesome.com/]
[bulma-site][https://bulma.io/]
[haml-site][http://haml.info/]
[devise-repo][https://github.com/heartcombo/devise]
[foreman-repo][https://github.com/ddollar/foreman]
[orig-rails-template][https://github.com/mattbrictson/rails-template]
