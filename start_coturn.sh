#!/bin/sh

if [ "${TURN_SECRET}" == "none" ]; then
  echo "Please provide a proper secret by overriding environment variable 'TURN_SECRET'!"
  exit 1
fi

echo "Starting TURN/STUN server"
# --no-stdout-log

exec turnserver -a -v -L 0.0.0.0 --server-name "${TURN_SERVER_NAME}" --static-auth-secret="${TURN_SECRET}" --realm=${TURN_REALM}  -p ${TURN_PORT} --min-port ${TURN_PORT_START} --max-port ${TURN_PORT_END} --log-file=${TURN_LOG_FILE} --simple-log ${TURN_EXTRA}
