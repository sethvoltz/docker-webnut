#!/usr/bin/env bash
set -xe

cat /app/webNUT/webnut/config.py

cd /app/webNUT && python setup.py install

cd webnut
exec pserve ../production.ini
