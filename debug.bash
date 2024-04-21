#!/bin/bash

meteor_pid="$(ps aux | grep meteor | grep ad-hoc | grep -v mongo | awk '{print $2}')"

if [[ -n "$meteor_pid" ]]; then
    kill -usr1 "$meteor_pid"

    echo "Done. Visit: chrome://inspect/#devices"
else
    echo "Failed to find the development environment Meteor process"
fi
