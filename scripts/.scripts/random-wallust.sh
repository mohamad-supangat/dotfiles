#!/bin/bash

for img in ~/Pictures/Wallpapers/*.{jpg,png,jpeg}; do
    cwal --img "$img" --quiet
done
