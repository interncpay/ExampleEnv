#!/bin/bash
set -e
echo "Starting entrypoint script..."

if [ "$1" = '/opt/mssql/bin/sqlservr' ]; then
  echo "SQL Server command detected..."

  if [ ! -f /tmp/app-initialized ]; then
    echo "Initializing application database..."

    function initialize_app_database() {
      echo "Waiting for SQL Server to start..."

      # Loop to check if SQL Server is ready
      retries=50
      wait_seconds=3
      for i in $(seq 1 $retries); do
        /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P SQLS3rv3r -Q "SELECT 1" && break
        echo "SQL Server is not ready yet... retrying in $wait_seconds seconds..."
        sleep $wait_seconds
      done

      echo "Running SQL scripts..."
      for f in /data/sql/*.sql; do
        echo "Executing $f..."
        /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P SQLS3rv3r -d master -i "$f"
      done

      echo "Initialization complete. Marking as initialized..."
      touch /tmp/app-initialized
    }

    initialize_app_database &
  else
    echo "Application database already initialized."
  fi
else
  echo "Non-SQL Server command detected: $@"
fi

echo "Executing passed command: $@"
exec "$@"
