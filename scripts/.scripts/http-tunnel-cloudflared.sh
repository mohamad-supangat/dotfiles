#!/bin/bash

# Usage: ./script.sh localhost:8080

cloudflared tunnel --url $1
