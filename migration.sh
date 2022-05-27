#!/bin/sh

if [ $# -ne 1 ]; then
  echo "argment is $#" 1>&2
  echo "pass one argment, up or down, please" 1>&2
  exit 1
fi

./migrate -database postgres://postgres:secret@postgres/go-heroku?sslmode=disable -path ./db/migrations $1

exit 0