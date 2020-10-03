#!/bin/sh

echo "CREATE DATABASE IF NOT EXISTS \`local_db\` ;" | "${mysql[@]}"
echo "GRANT ALL ON \`local_db\`.* TO '"$MYSQL_USER"'@'%' ;" | "${mysql[@]}"
echo 'FLUSH PRIVILEGES ;' | "${mysql[@]}"
