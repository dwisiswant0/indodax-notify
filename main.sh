#!/bin/bash

source "$(dirname "$(readlink -f "$0")")/src/functions.sh" .

COIN="btc"
PAIR="idr"
ORDER="sell"
PRICE="$(format $(getPrice ${COIN} ${PAIR} ${ORDER}))"

sendNotif "${PAIR}" "${PRICE}" "${COIN}"