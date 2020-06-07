#!/bin/sh

API="https://api.kraken.com/0/public/Ticker?pair="
pair0="ETHUSD"
pair1="XBTUSD"

eth=$(curl -sf $API+$pair0 | jq -r ".result.XETHZUSD.c[0]")
btc=$(curl -sf $API+$pair1 | jq -r ".result.XXBTZUSD.c[0]")
status=$(LANG=C printf "Ξ %.2f  %.2f" "$eth" "$btc")

echo "$status"
