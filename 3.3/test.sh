OSMFILE=$1
PGDIR=$2
THREADS=$3

chown postgres:postgres /data/$PGDIR && \

export  PGDATA=/data/$PGDIR  && \
sudo -u postgres /usr/lib/postgresql/11/bin/pg_ctl -D /data/$PGDIR start && \
chown -R nominatim:nominatim ./src && \
sudo -u nominatim ./src/build/utils/setup.php --osm-file $OSMFILE --all --threads $THREADS && \
sudo -u postgres /usr/lib/postgresql/11/bin/pg_ctl -D /data/$PGDIR stop && \
sudo chown -R postgres:postgres /data/$PGDIR
