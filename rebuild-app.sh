#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
(
"$SCRIPT_DIR/launcher" rebuild app
docker exec app bash -c '[[ "$(cat /etc/hosts|grep wp.test.mpop)" != "" ]] || echo "$(cat /etc/hosts|grep 172|xargs -n 1|sed -n 1p|sed -E "s/(^[0-9]+\.[0-9]+\.[0-9]+\.)[0-9]+/\11/") wp.test.mpop" >> /etc/hosts'
) >> "$SCRIPT_DIR/launcher.log" 2>&1 &

echo "Script lanciato in background con PID: $!"