#!/bin/bash
# wait-for-postgres.sh

set -e

host="$1"
shift
cmd="$@"

until pg_isready -d $DATABASE_URL -q; do
  >&2 echo "Postgres is not ready to recieve connections yet - sleeping"
  sleep 10
done

>&2 echo "Postgres is up and running - executing command"
if $cmd; then
    echo command returned true
else
    echo command returned some error
fi