#!/usr/bin/env bash

nginx

crontab /etc/cron.d/mirror-cron
touch /var/log/cron.log
cron && tail -f /var/log/cron.log
