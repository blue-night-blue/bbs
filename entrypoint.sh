#!/bin/bash
set -e
rm -f /bbs/tmp/pids/server.pid

bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:migrate:status
bundle exec rails db:seed

exec "$@"
