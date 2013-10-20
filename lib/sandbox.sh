#!/bin/sh
# Used in the sandbox rake task in Rakefile

rm -rf ./sandbox
bundle exec rails new sandbox --skip-bundle
if [ ! -d "sandbox" ]; then
  echo 'sandbox rails application failed'
  exit 1
fi

cd ./sandbox
echo "gem 'jobbee', :path => '..'" >> Gemfile

bundle install --gemfile Gemfile
bundle exec rails g jobbee:install --auto-accept