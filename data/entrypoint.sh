#!/bin/bash
set -e
if [ "$1" = '/opt/mssql/bin/sqlservr' ]; then
  # If this is the container's first run, initialize the application database
  if [ ! -f /tmp/app-initialized ]; then
    # Initialize the application database asynchronously in a background process.
    function initialize_app_database() {
      # Wait a bit for SQL Server to start.
      sleep 15s
      # Run all SQL files in the /data/sql directory
      for f in /data/sql/*.sql; do
        /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P SQLS3rv3r -d master -i "$f"
      done
      # Note that the container has been initialized so future starts won't wipe changes to the data
      touch /tmp/app-initialized
    }
    initialize_app_database &
  fi
fi
exec "$@"
