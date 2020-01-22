#!/bin/bash

service lircd start

EXEC_RC=/app/conf/lircrc

if [ ! -f ${EXEC_RC} ]; then
    EXEC_RC=/etc/lirc/lircrc
fi
irexec ${EXEC_RC}
