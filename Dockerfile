FROM busybox

EXPOSE 11211
ENV MAX_MEM 64
ENV MAX_CONN 1024

COPY nsswitch.conf /etc/nsswitch.conf
ADD lib64   /lib64
ADD lib     /lib
ADD usr/lib /lib

COPY memcached /bin/memcached

USER nobody
# need shell form for variables to work
CMD exec /bin/memcached -v -m $MAX_MEM -c $MAX_CONN
