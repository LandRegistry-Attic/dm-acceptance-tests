#!/bin/bash -l


export PATH=$PATH:/usr/local/bin

currentLocation="$(cd "$(dirname "$0")"; pwd)"

gemfile=$currentLocation/Gemfile

BUNDLE_GEMFILE=$gemfile bundle install

BUNDLE_GEMFILE=$gemfile bundle exec rubocop -c $currentLocation/rubocop.yml

exit $?
