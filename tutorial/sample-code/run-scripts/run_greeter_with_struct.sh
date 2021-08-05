#!/usr/bin/env -S bash -o errexit -o nounset -o pipefail

fldist \
--node-id 12D3KooWKnEqMfYo9zvfHmqTLpLdiHXPe4SVqUWcWHDJdFGrSmcA \
run_air \
-p sample-code/air-scripts/greeter_with_struct.greeter.air \
 -d '{"host_service":{"service_id":"c9a315de-4fe2-4730-8f40-9209428383bc", "node": "12D3KooWKnEqMfYo9zvfHmqTLpLdiHXPe4SVqUWcWHDJdFGrSmcA"}, "name": "Aqua", "greet": true}' \
 --generated