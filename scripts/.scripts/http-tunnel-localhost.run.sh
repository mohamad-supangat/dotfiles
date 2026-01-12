#!/bin/bash

# Usage: ./script.sh [port]
PORT="${1:-3000}"

ssh -R 80:localhost:$port localhost.run
