#!/bin/bash

[ -n "$VALIDATE" ] && validate="validate"

steamcmd \
	+login anonymous \
	+app_update $STEAMAPPID $validate \
	+quit
