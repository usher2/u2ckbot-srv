#!/bin/sh

set -e

configfile="/tmp/u2ckbot.conf"
if [ -e "${configfile}" ]; then
        rm -f "${configfile}"
fi

if [ ! -z "${DEBUG_LEVEL}" ]; then
	echo "LogLevel=${DEBUG_LEVEL}" >> "${configfile}"
fi

if [ ! -z "${TOKEN}" ]; then
	echo "Token=${TOKEN}" >> "${configfile}"
fi

if [ ! -z "${CKDUMPSERVER}" ]; then
	echo "CkDumpServer=${CKDUMPSERVER}" >> "${configfile}"
fi

/go/bin/u2ckbot -c "${configfile}"

