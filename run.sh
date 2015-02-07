#!/bin/bash

REDIS_CONF=/data/conf/redis.conf

if [ ! -f /data/conf/redis.conf ]; then
    mkdir -p /data/conf
    mkdir -p /data/log
    mkdir -p /data/data

    cp /etc/redis/redis.conf $REDIS_CONF

    sed -i 's/daemonize yes/daemonize no/g' $REDIS_CONF
    sed -i 's/bind 127.0.0.1/bind 0.0.0.0/g' $REDIS_CONF
    sed -i "s/^logfile.*/logfile \/data\/log\/redis-server.log/g" $REDIS_CONF
    sed -i "s/^dir.*/dir \/data\/data/g" $REDIS_CONF
    sed -i "s/^vm-swap-file.*/vm-swap-file \/data\/data\/redis.swap/g" $REDIS_CONF

    chown -R redis:redis /data
fi

exec sudo -u redis /usr/bin/redis-server $REDIS_CONF

