#!/bin/bash -l


currentLocation="$(cd "$(dirname "$0")"; pwd)"

gemfile=$currentLocation/Gemfile

set -e

rm -f sshot*

sudo pip3 install -r requirements.txt
python3 setup_initial_data/data_importer.py /data/mortgage_document postgresql://vagrant:vagrant@localhost:5432/deed_api mortgage_document

BUNDLE_GEMFILE=$gemfile bundle install

if [ -z "$@"]
  then
  BUNDLE_GEMFILE=$gemfile bundle exec cucumber $currentLocation --tags ~@wip
else
  BUNDLE_GEMFILE=$gemfile bundle exec cucumber $currentLocation $@
fi

if [ -z "$ESEC_INTEGRATION"]; then
    python3 server.py True "Digital Mortgage"
fi
