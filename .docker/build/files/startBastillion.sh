#!/bin/sh

function savejceks {
  # copy JCEKS to persistent folder
  echo "[startBastillion.sh INFO] copy JCEKS file to a save place"
  cp /opt/bastillion/jetty/bastillion/WEB-INF/classes/bastillion.jceks \
     /opt/bastillion/jetty/bastillion/WEB-INF/classes/keydb/bastillion.jceks
}

trap savejceks EXIT

# restore bastillion.jceks from persistent storage
if [ -f /opt/bastillion/jetty/bastillion/WEB-INF/classes/keydb/bastillion.jceks ]; then
  echo "[startBastillion.sh INFO] restoring JCEKS file from persistent storage"
  cp /opt/bastillion/jetty/bastillion/WEB-INF/classes/keydb/bastillion.jceks \
     /opt/bastillion/jetty/bastillion/WEB-INF/classes/bastillion.jceks
fi

  # prepare public-private keypair if it doesn't exist
if [ ! -f /opt/bastillion/jetty/bastillion/WEB-INF/classes/keydb/bastillion.pub ]; then
  PASSPHRASE=$(cat /dev/urandom | tr -dc A-Za-z0-9 | head -c64)
  ssh-keygen -t rsa -b 4096 -f /opt/bastillion/jetty/bastillion/WEB-INF/classes/keydb/bastillion -C keybox -P "$PASSPHRASE"
fi

# change to jetty dir and start jetty
cd jetty
java -Xms256m -Xmx256m -jar start.jar
