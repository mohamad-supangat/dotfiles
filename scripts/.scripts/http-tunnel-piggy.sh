#!/bin/bash

# Usage: ./script.sh [port]
PORT="${1:-3000}"

ssh -p 443 -R0:localhost:$PORT a.pinggy.io
