#!/bin/bash

# Use the value of the corresponding environment variable, or the
# default if none exists.
: ${VAULTWARDEN_ROOT:="/opt/vwdata"}

BACKUP_ROOT="/opt/vwbackups"
BACKUP_LOGS="${BACKUP_ROOT}/logs"
BACKUP_TIMESTAMP="$(date '+%Y%m%d-%H%M')"

if "${BACKUP_ROOT}"/backup.sh >"${BACKUP_ROOT}"/backup.log 2>&1; then
    RESULT="success"
    EXITCODE=0
else
    RESULT="failure"
    EXITCODE=1
fi

cp -a "${BACKUP_ROOT}"/backup.log "${BACKUP_LOGS}"/backup-${RESULT}-${BACKUP_TIMESTAMP}.log
exit ${EXITCODE}
