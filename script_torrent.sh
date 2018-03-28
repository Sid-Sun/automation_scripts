#!/bin/bash

mkdir $BUILD_NUMBER

transmission-cli -ep $link -w $BUILD_NUMBER -b http://john.bitsurge.net/public/biglist.p2p.gz
