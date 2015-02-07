#
# rpidockers/redis Dockerfile
#
 
FROM sdhibit/rpi-raspbian 

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y redis-server sudo

VOLUME /data

EXPOSE 6379

ADD run.sh /bin/

CMD /bin/run.sh
