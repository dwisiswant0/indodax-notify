#!/bin/bash
# 
# MIT License
# 
# Copyright (c) 2021 dwisiswant0
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

INDODAX="indodax.com"

format() {
	echo "${1}" | sed -e :a -e "s/\(.*[0-9]\)\([0-9]\{3\}\)/\1.\2/;ta"
}

getPrice() {
	# getPrice symbol pair sell/buy
	curl "https://${INDODAX}/api/${1,,}_${2,,}/depth" -s \
	  -H "Authority: ${INDODAX}" \
	  -H "Cache-Control: no-cache" \
	  -H "Accept: application/json" \
	  -H "X-Requested-With: XMLHttpRequest" \
	  -H "Referer: https://${INDODAX}/market/${1^^}${2^^}" \
	  -H "Origin: https://${INDODAX}" | jq ".${3,,}[0][0]"
}

sendNotif() {
	# sendNotif pair price coin
	notify-send -u low \
	  "${INDODAX^}" "${1^^} ${2}/${3^^}" \
	  -o "View:xdg-open https://${INDODAX}/chart/${3^^}${1^^}" \
	  -o "Close:false" \
	  -i "$(dirname "$(readlink -f "$0")")/assets/${3,,}.png"
}