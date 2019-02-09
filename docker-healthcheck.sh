#!/bin/bash

set -euo pipefail

if nc -z localhost 8081 && nc -z localhost 8085; && nc -z localhost 8086; && nc -z localhost 1119; then
	exit 0
fi

exit 1
