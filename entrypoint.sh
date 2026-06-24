#!/bin/bash

set -euo pipefail

if [[ "$#" -eq "0" ]]; then
	# No arguments given, run the syntax checker on every Puppet manifest in the current directory
	mapfile -d '' FILES < <(/usr/bin/find . -iname '*.pp' -type f -print0)
	if [[ ${#FILES[@]} -eq 0 ]]; then
		echo "No Puppet manifest files (*.pp) found in the current directory."
		exit 0
	fi
	xargs -0 /opt/puppetlabs/bin/puppet parser validate < <(printf '%s\0' "${FILES[@]}")
else
	# Run the syntax checker on the given files / directories
	exec /opt/puppetlabs/bin/puppet parser validate "$@"
fi