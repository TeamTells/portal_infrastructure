#!/bin/bash

# Create default user
psql postgresql://"$DB_USER":"$DB_PASSWORD"@"$DB_HOST":5432/"$DB_NAME" << EOF
       INSERT INTO auth_user (login, salt, password)
       VALUES ('test6', 'test_salt', 'e057cab20ad95e02d15baada6e394ef62884769d7006a1cd09bd8b0e43b76d22')
EOF