#!/bin/bash -l

currentLocation="$(cd "$(dirname "$0")"; pwd)"

gemfile=$currentLocation/Gemfile

set -e

rm -f sshot*

BUNDLE_GEMFILE=$gemfile bundle install

if [ -z "$@"]
  then
  BUNDLE_GEMFILE=$gemfile bundle exec cucumber $currentLocation --tags ~@wip
else
  BUNDLE_GEMFILE=$gemfile bundle exec cucumber $currentLocation $@
fi
