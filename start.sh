#!/bin/bash
echo "term:${USER_PASSWORD}" | chpasswd #USER_PASSWORD is passed in on docker run so it can read from the user mapping
/bin/chown -R term:term /home/term
supervisord -c /etc/supervisor/supervisord.conf
