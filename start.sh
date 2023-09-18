#!/bin/bash
#echo "term:${USER_PASSWORD}" | chpasswd #USER_PASSWORD is passed in on docker run so it can read from the user mapping
#/bin/chown -R term:term /home/term
#supervisord -c /etc/supervisor/supervisord.conf
/opt/node-v18.17.1-linux-x64/bin/wetty --host 127.0.0.1 --port 8080 --ssh-host colab-roots-terminal-dev --ssh-port 22 --ssh-user term --title colab-bash --ssh-config /etc/ssh/ssh_config --base /