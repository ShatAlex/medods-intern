#!/bin/bash
# wait-for-postgres.sh

set -e

host="$1"
pass="ShatAlex"
shift
cmd="$@"

until PGPASSWORD=$pass psql -h "$host" -U "postgres" -c '\q'; do
    >&2 echo "Postgres is unavailable - sleeping"
    sleep 1
done

>&2 echo "Postgres is up - executing command"
exec $cmd