#!/usr/bin/env fish

for d in *(/); stow -v -t ~/ -S $d; end
