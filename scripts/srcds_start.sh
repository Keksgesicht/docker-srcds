#!/bin/bash

cd ${INSTALLDIR}/${COMNAME}
./srcds_run \
	-game $GAMENAME \
	$SVPARAMS \
	-norestart \
	-nohltv \
	+hostport $SVPORT
